import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1024;
        bool isDesktop = width >= 1024;

        // Responsive values
        double titleSize = isMobile
            ? 22
            : isTablet
            ? 28
            : 34;
        double subtitleSize = isMobile
            ? 14
            : isTablet
            ? 16
            : 18;
        double sectionTitleSize = isMobile
            ? 18
            : isTablet
            ? 22
            : 26;
        EdgeInsets sectionPadding = isMobile
            ? const EdgeInsets.all(0)
            : const EdgeInsets.symmetric(horizontal: 40, vertical: 24);
        return Container(
          height: 800,
          width: double.infinity,
          padding: sectionPadding,
          color: Colors.blue[900],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bigcomapany.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 400,
                ),
                SizedBox(height: 20),

                // Main Heading
                Text(
                  "Welcome To DigiTech Edge",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                // Sub Heading
                Text(
                  "Welcome to DigiTech Edge - Your Partner for Tech Excellence. "
                  "Our skilled team provides tailored technology solutions to elevate your business.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: subtitleSize,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),

                // Why Choose Us
                Text(
                  "Why Choose Us ?",
                  style: TextStyle(
                    fontSize: sectionTitleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),

                // Responsive Layout: Column for mobile, Row for tablet/desktop
                isMobile
                    ? Column(
                        children: [
                          _buildFeatureBox(
                            "Proven expertise\nUnwavering quality commitment",
                          ),
                          _buildFeatureBox(
                            "Customer-focused solutions\nDriving innovation and growth",
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: _buildFeatureBox(
                              "Proven expertise\nUnwavering quality commitment",
                            ),
                          ),
                          Expanded(
                            child: _buildFeatureBox(
                              "Customer-focused solutions\nDriving innovation and growth",
                            ),
                          ),
                        ],
                      ),

                const SizedBox(height: 20),

                // About Us link
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.info, color: Colors.white),
                  label: const Text(
                    "About Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Reusable Feature Box
  Widget _buildFeatureBox(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[800],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white30),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
