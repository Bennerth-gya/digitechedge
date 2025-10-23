import 'dart:async';
import 'package:flutter/material.dart';

class ClientReviews extends StatefulWidget {
  const ClientReviews({super.key});

  @override
  State<ClientReviews> createState() => _ClientReviewsState();
}

class _ClientReviewsState extends State<ClientReviews> {
  int currentIndex = 0;

  // 👇 Client reviews data
  final List<Map<String, String>> reviews = [
    {
      "name": "Sarah Johnson",
      "message":
          "Working with DigiTech Edge transformed our online presence! The team was professional, responsive, and creative.",
    },
    {
      "name": "Michael Roberts",
      "message":
          "Their innovative solutions boosted our efficiency and helped us reach more customers. Highly recommended!",
    },
    {
      "name": "Emily Carter",
      "message":
          "The level of support and expertise we received was top-notch. DigiTech Edge truly cares about client success.",
    },
  ];

  @override
  void initState() {
    super.initState();
    // Automatically change review every 5 seconds
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 1) % reviews.length;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1024;

    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "What Our Clients Say",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 40),

          // 👇 Animated review card
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            transitionBuilder: (child, animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _buildReviewCard(
              name: reviews[currentIndex]["name"]!,
              message: reviews[currentIndex]["message"]!,
              isMobile: isMobile,
              isTablet: isTablet,
              key: ValueKey<int>(currentIndex),
            ),
          ),

          const SizedBox(height: 30),

          // 👇 Indicator dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(reviews.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: currentIndex == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentIndex == index ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  /// 🧩 Review card widget
  Widget _buildReviewCard({
    required String name,
    required String message,
    required bool isMobile,
    required bool isTablet,
    required Key key,
  }) {
    double cardWidth = isMobile ? double.infinity : (isTablet ? 600 : 700);

    return Container(
      key: key,
      width: cardWidth,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 👇 Default profile icon
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 20),

          // 👇 Client message
          Text(
            '"$message"',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          // 👇 Client name
          Text(
            "- $name",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
