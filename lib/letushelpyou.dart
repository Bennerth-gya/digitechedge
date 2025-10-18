import 'package:flutter/material.dart';
import 'underline.dart'; // for your custom underline widget

class LetUsHelpYou extends StatelessWidget {
  const LetUsHelpYou({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1024;
        bool isDesktop = width >= 1024;

        // text sizes
        double headingSize = isMobile ? 22 : isTablet ? 26 : 32;
        double numberSize = isMobile ? 20 : isTablet ? 22 : 26;
        double titleSize = isMobile ? 16 : isTablet ? 18 : 20;
        double subtitleSize = isMobile ? 14 : isTablet ? 16 : 18;

        // padding
        EdgeInsets sectionPadding = isMobile
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 60, vertical: 40);

        // reusable item
        Widget buildHelpItem(String number, String title, String description) {
          return Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    number,
                    style: TextStyle(
                      fontSize: numberSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: subtitleSize,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
              // Section title
              Column(
                children: [
                  const SizedBox(height: 6),
                  UnderlineTitle(text: 'Let us help you'),
                  const SizedBox(height: 40),
                ],
              ),

              // Items (responsive layout)
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHelpItem(
                      "01",
                      "Optimize Your Systems for Peak Performance",
                      "We'll ensure your computer systems and networks run at maximum efficiency.",
                    ),
                    buildHelpItem(
                      "02",
                      "Provide Reliable Support and Maintenance",
                      "Our support team is available 24/7 to address any issues, minimizing disruptions and keeping your business running smoothly.",
                    ),
                    buildHelpItem(
                      "03",
                      "Strategize for Growth and Scalability",
                      "As your business expands, your IT needs will change. We'll work closely with you to develop a scalable IT strategy that accommodates your growth.",
                    ),
                    buildHelpItem(
                      "04",
                      "Stay Ahead of Technology Trends",
                      "Technology is ever-evolving, and staying informed can give your business a distinct edge. Our team stays current with the latest advancements, ensuring you benefit from cutting-edge solutions that drive efficiency and innovation.",
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    buildHelpItem(
                      "01",
                      "Optimize Your Systems for Peak Performance",
                      "We'll ensure your computer systems and networks run at maximum efficiency.",
                    ),
                    buildHelpItem(
                      "02",
                      "Provide Reliable Support and Maintenance",
                      "Our support team is available 24/7 to address any issues, minimizing disruptions and keeping your business running smoothly.",
                    ),
                    buildHelpItem(
                      "03",
                      "Strategize for Growth and Scalability",
                      "As your business expands, your IT needs will change. We'll work closely with you to develop a scalable IT strategy that accommodates your growth.",
                    ),
                    buildHelpItem(
                      "04",
                      "Stay Ahead of Technology Trends",
                      "Technology is ever-evolving, and staying informed can give your business a distinct edge. Our team stays current with the latest advancements, ensuring you benefit from cutting-edge solutions that drive efficiency and innovation.",
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
