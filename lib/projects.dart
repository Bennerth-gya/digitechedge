import 'package:digitechedge/underline.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1024;
        bool isDesktop = width >= 1024;

        // Responsive text sizes
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
        double buttonFontSize = isMobile ? 14 : 16;

        // Padding
        EdgeInsets sectionPadding = isMobile
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 60, vertical: 40);

        return Container(
          width: double.infinity, // make it responsive
          padding: sectionPadding,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title
              UnderlineTitle(text: 'Projects'),
              const SizedBox(height: 12),

              // Subtitle
              Text(
                "Browse Through Our Works",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: subtitleSize, color: Colors.black87),
              ),
              const SizedBox(height: 20),

              // Browse Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 60 : 90,
                    vertical: 30,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Browse",
                  style: TextStyle(
                    fontSize: buttonFontSize,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Animation instead of image
              isMobile
                  ? Column(children: _buildProjectAnimations())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildProjectAnimations()
                          .map((widget) => Expanded(child: widget))
                          .toList(),
                    ),
            ],
          ),
        );
      },
    );
  }

  /// Project Animation Containers
  List<Widget> _buildProjectAnimations() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/devices.jpg'),
      ),
    ];
  }
}
