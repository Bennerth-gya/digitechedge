import 'dart:async';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Rotating sections (title, description, button text)
  final List<Map<String, String>> rotatingSections = [
    {
      "title": "About Us",
      "description":
          "We are a digital solutions company focused on innovation, design, and technology to help businesses thrive online.",
      "button": "Learn More",
    },
    {
      "title": "Our Projects",
      "description":
          "Explore our portfolio of creative projects that have transformed brands and boosted growth through technology.",
      "button": "View Projects",
    },
    {
      "title": "Get in Touch",
      "description":
          "Have a project in mind? Let’s collaborate to bring your ideas to life with our expert digital solutions.",
      "button": "Contact Us",
    },
    {
      "title": "What We Do",
      "description":
          "From web design to app development, we provide end-to-end digital services to empower your business.",
      "button": "Discover More",
    },
  ];

  int currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Change section every 4 seconds
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % rotatingSections.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;

    return Container(
      width: double.infinity,
      height: isMobile
          ? 550
          : isTablet
          ? 600
          : 700,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/banner.webp"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              const Color(0xFF0B5FA5).withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Fixed welcome message
              Text(
                "Welcome to DigiTech Edge",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isMobile ? 28 : 42,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 50),

              // 🔁 Rotating Section
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                transitionBuilder: (child, animation) =>
                    FadeTransition(opacity: animation, child: child),
                child: Column(
                  key: ValueKey<int>(currentIndex),
                  children: [
                    Text(
                      rotatingSections[currentIndex]["title"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 22 : 28,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        rotatingSections[currentIndex]["description"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: isMobile ? 16 : 18,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // You can navigate to specific pages here
                        debugPrint(
                          "${rotatingSections[currentIndex]["button"]} button clicked!",
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        rotatingSections[currentIndex]["button"]!,
                        style: TextStyle(
                          color: const Color(0xFF0B5FA5),
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
