import 'package:flutter/material.dart';
import 'underline.dart'; // optional if you use your custom underline widget

class OurClients extends StatelessWidget {
  const OurClients({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1024;
        bool isDesktop = width >= 1024;

        // Font sizes
        double numberSize = isMobile
            ? 18
            : isTablet
            ? 20
            : 22;
        double titleSize = isMobile
            ? 18
            : isTablet
            ? 20
            : 22;
        double descriptionSize = isMobile
            ? 14
            : isTablet
            ? 16
            : 16;

        // Padding
        EdgeInsets sectionPadding = isMobile
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 60, vertical: 40);

        // Reusable client card widget
        Widget buildClientItem(
          String number,
          String title,
          String description,
          String imagePath, {
          bool expand = false,
        }) {
          Widget item = Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: TextStyle(
                    fontSize: numberSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: descriptionSize,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Read More",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_right_alt, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
          );

          return expand ? Expanded(child: item) : item;
        }

        // Build main section
        return Container(
          width: double.infinity,
          padding: sectionPadding,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 6),
              const Text(
                "Our Clients",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Container(height: 3, width: 80, color: Colors.blue),
              const SizedBox(height: 40),

              // Responsive Layout
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildClientItem(
                      "01.",
                      "CyberSecurity Trends",
                      "Protect your digital assets with insights on current threats and learn from the best defense mechanisms.",
                      "assets/images/cybersecurity image.jpeg",
                      expand: true,
                    ),
                    buildClientItem(
                      "02.",
                      "Tech Guides",
                      "Stay updated on emerging technology trends to remain competitive.",
                      "assets/images/tech guides.jpeg",
                      expand: true,
                    ),
                    buildClientItem(
                      "03.",
                      "IT Career Advice",
                      "Discover strategies to grow your IT career with expert guidance and advice.",
                      "assets/images/itcareer.webp",
                      expand: true,
                    ),
                    buildClientItem(
                      "04.",
                      "Cloud Computing",
                      "Cloud innovations are transforming the tech world — adaptability is key.",
                      "assets/images/cloud computing.png",
                      expand: true,
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    buildClientItem(
                      "01.",
                      "CyberSecurity Trends",
                      "Protect your digital assets with insights on current threats and learn from the best defense mechanisms.",
                      "assets/images/cybersecurity image.jpeg",
                    ),
                    buildClientItem(
                      "02.",
                      "Tech Guides",
                      "Stay updated on emerging technology trends to remain competitive.",
                      "assets/images/tech guides.jpeg",
                    ),
                    buildClientItem(
                      "03.",
                      "IT Career Advice",
                      "Discover strategies to grow your IT career with expert guidance and advice.",
                      "assets/images/itcareer.webp",
                    ),
                    buildClientItem(
                      "04.",
                      "Cloud Computing",
                      "Cloud innovations are transforming the tech world — adaptability is key.",
                      "assets/images/cloud computing.png",
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
