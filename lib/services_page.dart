import 'package:digitechedge/expolre_button.dart';
import 'package:digitechedge/underline.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1024;
        bool isDesktop = width >= 1024;

        // responsive text sizes
        double titleSize = isMobile
            ? 22
            : isTablet
            ? 26
            : 32;
        double subtitleSize = isMobile
            ? 14
            : isTablet
            ? 16
            : 18;
        double headingSize = isMobile
            ? 24
            : isTablet
            ? 28
            : 34;
        double subHeadingSize = isMobile
            ? 16
            : isTablet
            ? 18
            : 20;

        // padding
        EdgeInsets sectionPadding = isMobile
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 60, vertical: 40);

        // reusable service item widget
        Widget buildServiceItem(
          String title,
          String description,
          IconData icon,
        ) {
          return Container(
            width: isDesktop
                ? (width / 2) - 80
                : double.infinity, // 2 per row on desktop
            margin: const EdgeInsets.only(bottom: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.blue, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: subtitleSize,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ExploreButton(
                        onPressed: () {
                          print("Explore $title clicked");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          width: double.infinity,
          padding: sectionPadding,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Section Title
              /*
              Text(
                "Our Services",
                style: TextStyle(
                  fontSize: headingSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              */
              UnderlineTitle(text: 'SERVICES'),
              const SizedBox(height: 15),
              // Section Subtitle
              Text(
                "We Deliver Expert Solutions",
                style: TextStyle(
                  fontSize: subHeadingSize,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Services Grid
              Wrap(
                spacing: 30, // horizontal spacing
                runSpacing: 25, // vertical spacing
                children: [
                  buildServiceItem(
                    "UI and UX Solutions",
                    "Creating intuitive and engaging user interfaces and experiences to enhance user satisfaction and interaction",
                    Icons.monitor,
                  ),
                  buildServiceItem(
                    "Web Design Solutions",
                    "Designing visually appealing and functional websites tailored to meet your business needs",
                    Icons.web,
                  ),
                  buildServiceItem(
                    "IT Skills Training",
                    "Providing comprehensive training programs to equip individuals with essential IT skills and knowledge",
                    Icons.school,
                  ),
                  buildServiceItem(
                    "Graphic Design",
                    "Crafting visually compelling graphics and visual content to effectively communicate your brand message.",
                    Icons.brush,
                  ),
                  buildServiceItem(
                    "IT Infrastructure Management",
                    "Managing and optimizing your IT infrastructure to ensure reliability and scalability.",
                    Icons.storage,
                  ),
                  buildServiceItem(
                    "IT Consulting and Strategy",
                    "Offering expert guidance to align IT initiatives with your business goals.",
                    Icons.insights,
                  ),
                  buildServiceItem(
                    "App Development",
                    "Building cross-platform mobile applications tailored to your business needs.",
                    Icons.phone_android,
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
