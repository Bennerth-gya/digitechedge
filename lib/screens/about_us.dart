import 'package:digitechedge/footer.dart';
import 'package:digitechedge/underline.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
                          true,
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
                          false,
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

                    // Semi-transparent overlay (optional)
                    Container(
                      width: double.infinity,
                      height: 300,
                      color: Colors.black.withOpacity(0.3),
                    ),

                    // Centered Text on the image
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          "About Us",
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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

                const SizedBox(height: 40),

                // 🔹 About Us Text Container
                Container(
                  color: Colors.white,
                  padding: sectionPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "At DigiTech Edge, we are a leading provider of innovative technology solutions, specializing in creating tailored systems that solve complex challenges across various sectors. With a team of highly skilled professionals, we offer a comprehensive range of IT services to drive efficiency, productivity, and growth for our clients.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "What sets DigiTech Edge apart is our commitment to staying at the forefront of technological advancements. We continuously invest in research and development, ensuring that our solutions leverage the latest industry best practices and cutting-edge technologies.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "At the core of DigiTech Edge is a team of passionate individuals who thrive on delivering excellence. We believe in fostering long-term partnerships with our clients, providing ongoing support and guidance to ensure their technology investments continue to meet their evolving needs.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Join the growing list of satisfied clients who have experienced the DigiTech Edge difference. Contact us today to learn how we can leverage technology to unlock new opportunities for your business.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  color: const Color.fromARGB(255, 37, 67, 120),
                  padding: sectionPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UnderlineTitle(
                        text: "MISSION",
                        textStyle: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        underlineColor: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Our mission is to cultivate a culture of relentless innovation, where creativity and intellectual curiosity thrive. We are committed to attracting and nurturing exceptional talent, fostering an environment that encourages bold thinking, calculated risk-taking, and cross-disciplinary collaboration.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 50),
                      UnderlineTitle(
                        text: 'VISSION',
                        underlineColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "DigiTech Edge company envision a future where technology seamlessly enhances every aspect of human life, empowering individuals and businesses to reach their full potential. We aim to create cutting-edge solutions that revolutionize industries, simplify complex challenges, and inspire wonder through their elegance and efficiency",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // <<<<<<<<<< CORE VALUES SECTION >>>>>>>>
                Container(
                  color: Colors.white,
                  padding: sectionPadding,
                  child: Column(
                    children: [
                      UnderlineTitle(
                        text: "CORE VALUES",
                        textStyle: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        underlineColor: Colors.black,
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Innovation: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "We embrace an entrepreneurial spirit and encourage unconventional thinking. We believe that true innovation stems from a willingness to challenge conventions, learn from failures, and continuously push the boundaries of what is achievable.ove our solutions.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Excellence: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "We are driven by a passion for excellence in everything we do, from ideation to execution. We set ambitious goals and consistently strive to exceed expectations, delivering products and services of the highest quality that exceed industry standards.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Integrity: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "We uphold unwavering ethical standards and operate with transparency, honesty, and accountability. We respect intellectual property rights, safeguard personal data, and prioritize the well-being of our customers, employees, and the communities we serve.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Collaboration: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'We believe that diverse perspectives and open communication are essential for driving progress. We foster an inclusive environment that encourages teamwork, knowledge-sharing, and constructive feedback, enabling us to achieve more together than we could individually.',
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Sustainability: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'We are committed to sustainable practices that minimize our environmental impact and contribute to a better future for generations to come. We strive to develop Eco-friendly technologies, reduce our carbon footprint, and promote responsible resource management.',
                          ),
                          SizedBox(height: 20),
                          Text(
                            'By upholding these core values, we aim to create a work environment that nurtures talent, fosters innovation, and delivers exceptional products and services that positively impact the world around us.',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                FooterSection(),
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
