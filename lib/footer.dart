import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;

    return Container(
      color: const Color(0xFF0B5FA5), // Main blue background
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          // Logo & tagline
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/digitechicon.png", // Replace with your logo path
                    height: 50,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "DigiTech Edge",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                "Empowering businesses with cutting-edge technology solutions.",
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Three Columns (Quick Links, Services, Contact)
          if (isMobile)
            Column(
              children: [
                buildSection("Quick Links", [
                  "Home",
                  "About Us",
                  "Services",
                  "Projects",
                ]),
                const SizedBox(height: 30),
                buildSection("Services", [
                  "CyberSecurity",
                  "Cloud Computing",
                  "UI/UX Design",
                  "IT Consulting",
                  "Web Development",
                ]),
                const SizedBox(height: 30),
                buildContactSection(),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSection("Quick Links", [
                  "Home",
                  "About Us",
                  "Services",
                  "Projects",
                ]),
                buildSection("Services", [
                  "CyberSecurity",
                  "Cloud Computing",
                  "UI/UX Design",
                  "IT Consulting",
                  "Web Development",
                ]),
                buildContactSection(),
              ],
            ),

          const SizedBox(height: 40),

          // Social Media Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FaIcon(FontAwesomeIcons.tiktok, color: Colors.white, size: 22),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.twitter, color: Colors.white, size: 22),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.linkedin, color: Colors.white, size: 22),
              SizedBox(width: 20),
              FaIcon(FontAwesomeIcons.instagram, color: Colors.white, size: 22),
            ],
          ),

          const SizedBox(height: 50),

          // Divider line
          Container(height: 1, color: Colors.white24, width: width * 0.8),

          const SizedBox(height: 40),

          // Newsletter Subscription Section
          Column(
            children: [
              const Text(
                "Subscribe to Our Newsletter",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: isMobile ? width * 0.9 : 400,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(8),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 49,
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(8),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Subscribe",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "© 2025 DigiTech Edge. All rights reserved.",
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper: Build text section (Quick Links, Services)
  Widget buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        for (String item in items)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              item,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),
      ],
    );
  }

  // Helper: Build contact info
  Widget buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "123 Tech Street, Digital City, 12345",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        SizedBox(height: 8),
        Text(
          "Phone: (+233) 549475922",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          "(+233) 540575329",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        SizedBox(height: 8),
        Text(
          "Email: digitechedgesolutions@gmail.com",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ],
    );
  }
}
