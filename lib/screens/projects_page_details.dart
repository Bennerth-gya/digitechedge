import 'package:flutter/material.dart';

class ProjectsPageDetails extends StatelessWidget {
  const ProjectsPageDetails({super.key});

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

        // Padding
        EdgeInsets sectionPadding = isMobile
            ? const EdgeInsets.all(16)
            : const EdgeInsets.symmetric(horizontal: 60, vertical: 40);

        return Scaffold(
          backgroundColor: Colors.green[50],

          // 🔹 Custom AppBar
          appBar: AppBar(
            automaticallyImplyLeading: false, // removes back arrow
            backgroundColor: Colors.white,
            elevation: 2,
            titleSpacing: 0,
            title: Stack(
              children: [
                // 🔸 Left: DigiTech Logo + Text
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/digitechicon.png',
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'DigiTech Edge',
                          style: TextStyle(
                            color: Color(0xFF0B5FA5),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // 🔸 Center: Navigation Buttons (Desktop Only)
                if (isDesktop)
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _navButton(
                          context,
                          "Home",
                          false,
                          const Color(0xFF0B5FA5),
                        ),
                        _navButton(
                          context,
                          "About Us",
                          false,
                          const Color(0xFF0B5FA5),
                        ),
                        _navButton(
                          context,
                          "What We Do",
                          false,
                          const Color(0xFF0B5FA5),
                        ),
                        _navButton(
                          context,
                          "Projects",
                          true,
                          const Color(0xFF0B5FA5),
                        ),
                        _navButton(
                          context,
                          "Get in Touch",
                          false,
                          const Color(0xFF0B5FA5),
                        ),
                      ],
                    ),
                  ),

                // 🔸 Right: Menu icon for mobile/tablet
                if (!isDesktop)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Color(0xFF0B5FA5)),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // 🔹 Drawer for Mobile/Tablet
          drawer: isDesktop
              ? null
              : Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Color(0xFF0B5FA5),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/digitechicon.png',
                              height: 40,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'DigiTech Edge',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      _drawerItem(context, "Home"),
                      _drawerItem(context, "About Us"),
                      _drawerItem(context, "What We Do"),
                      _drawerItem(context, "Projects", isActive: true),
                      _drawerItem(context, "Get in Touch"),
                    ],
                  ),
                ),

          // 🔹 Page Content
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Building Image
                // 🔹 Banner with Text Overlay
                Stack(
                  children: [
                    // Background Image
                    Image.asset(
                      'assets/images/banner.webp',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 300,
                    ),

                    // Semi-transparent overlay (optional for better text contrast)
                    Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.black.withOpacity(0.3),
                    ),

                    // Centered Text on the image
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "Projects Page",
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .white, // white text looks better on overlay
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 2),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 🔘 Navigation Button for Desktop
  Widget _navButton(
    BuildContext context,
    String title,
    bool isActive,
    Color activeColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () => _navigate(context, title),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? activeColor : Colors.black,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // 🔘 Drawer item for Mobile/Tablet
  Widget _drawerItem(
    BuildContext context,
    String title, {
    bool isActive = false,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFF0B5FA5) : Colors.black,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        _navigate(context, title);
      },
    );
  }

  // 🔁 Navigation Logic
  void _navigate(BuildContext context, String title) {
    switch (title) {
      case "Home":
        Navigator.pushNamed(context, '/home');
        break;
      case "About Us":
        Navigator.pushNamed(context, '/about');
        break;
      case "What We Do":
        Navigator.pushNamed(context, '/services');
        break;
      case "Projects":
        Navigator.pushNamed(context, '/projects');
        break;
      case "Get in Touch":
        Navigator.pushNamed(context, '/contact');
        break;
    }
  }
}
