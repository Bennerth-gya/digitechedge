import 'package:flutter/material.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Center(
          child: Text(
            'D E S K T O P',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400 ),
            ),
        )
      ),
    );
  }
}