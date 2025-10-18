import 'package:flutter/material.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lime,
          body: Center(
            child: Text(
              'M O B I L E',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
              ),
          ),
        ),
    );
  }
}