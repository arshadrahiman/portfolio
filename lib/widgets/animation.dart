import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> textList = [
      'Senior Flutter Developer',
      'Full Stack Developer',
      'Mobile App Developer',
      'Web Developer',
      'Backend Developer',
      'QA & Automation Engineer',
      'Entrepreneur',
    ];

    return AnimatedTextKit(
      animatedTexts: textList.map((text) => TyperAnimatedText(
        text,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        speed: const Duration(milliseconds: 100),
      )).toList(),
      repeatForever: true,
      pause: const Duration(milliseconds: 1000),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
    );
  }
}
