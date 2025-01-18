import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  final List<String> textList = [
    'Tech Lead', // A leadership/management role in the tech field
    'Senior Flutter Developer', // Specialized senior developer role
    'Full Stack Developer', // Developer with expertise in both front-end and back-end
    'Software Engineer', // Broad engineering role, including software development
    'Mobile App Developer', // Developer focused on mobile app development
    'Web Developer', // Developer focused on web development
    'Project Manager', // Management role overseeing projects
    'Entrepreneur', // Someone who starts and runs their own business
  ];
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

    // Start looping through the text list
    Future.delayed(Duration.zero, _startTextAnimation);
  }

  void _startTextAnimation() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 2)); // Time for each text
      setState(() {
        currentIndex = (currentIndex + 1) % textList.length;
      });
      return true; // Continue looping
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          textList[currentIndex], // Text from array
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      repeatForever: true, // Loop the animation
    );
  }
}
