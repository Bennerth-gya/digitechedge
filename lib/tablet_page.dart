import 'package:flutter/material.dart';

class TabletPage extends StatelessWidget {
  const TabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'TABLET',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}