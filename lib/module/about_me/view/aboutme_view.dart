import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'I am a passionate Flutter developer with 6+ years of experience in building mobile applications.',
                style: TextStyle(
                    fontSize: isMobile ? 16 : 18, color: Colors.grey[800]),
              ),
              SizedBox(height: 20),
              Text(
                'I specialize in creating beautiful, responsive, and user-friendly apps using Flutter and Dart. '
                'My goal is to make mobile experiences more intuitive and seamless.',
                style: TextStyle(
                    fontSize: isMobile ? 14 : 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}
