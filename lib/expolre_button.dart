import 'package:flutter/material.dart';

class ExploreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ExploreButton({
    super.key,
    required this.onPressed,
    this.label = "Explore", // default label
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
