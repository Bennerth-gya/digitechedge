import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideButton extends StatefulWidget {
  const SlideButton({super.key});

  @override
  State<SlideButton> createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SlideAction(
            borderRadius: 12,
            elevation: 0,
            innerColor: Colors.blue,
            outerColor: Colors.white,
            sliderButtonIcon: Icon(
              Icons.lock_open, color:  Colors.blue
              ),
              text: 'Slide to see our projects',
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 27
              ),
            onSubmit: () {
              // do something

            },
          ),
        ),
      ),
    );

  }
}