import 'package:flutter/material.dart';

class OurClients extends StatelessWidget {
  const OurClients({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;

    return Container(
      // 👇 Increased height to remove overflow (Option 3)
      height: isMobile ? 1200 : 1000, // adjust as needed
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section title
          const Text(
            "Our Clients",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(height: 3, width: 80, color: Colors.black),
          const SizedBox(height: 30),

          // Client cards
          Expanded(
            child: GridView.count(
              crossAxisCount: isMobile ? 1 : 2, // 1 per row for mobile
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.1 : 1.6,
              physics: const NeverScrollableScrollPhysics(), // disables scroll
              children: const [
                ClientCard(
                  number: "01.",
                  title: "CyberSecurity Trends",
                  description:
                      "Protect your digital assets with insights on current threats and learn from the best defense mechanisms.",
                  imagePath: "lib/images/cybersecurity image.jpeg",
                ),
                ClientCard(
                  number: "02.",
                  title: "Tech Guides",
                  description:
                      "Stay updated on emerging technology trends to remain competitive.",
                  imagePath: "lib/images/tech guides.jpeg",
                ),
                ClientCard(
                  number: "03.",
                  title: "IT Career Advice",
                  description:
                      "Discover strategies to grow your IT career with expert guidance and advice.",
                  imagePath: "lib/images/itcareer.webp",
                ),
                ClientCard(
                  number: "04.",
                  title: "Cloud Computing",
                  description:
                      "Cloud innovations are transforming the tech world — adaptability is key.",
                  imagePath: "lib/images/cloud computing.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClientCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final String imagePath;

  const ClientCard({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
            style: const TextStyle(fontSize: 14, color: Colors.black87),
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
  }
}
