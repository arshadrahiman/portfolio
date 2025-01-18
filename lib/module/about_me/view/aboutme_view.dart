import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // About Me Title
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.5, end: 1.0),
                  duration: Duration(seconds: 1),
                  builder: (context, double scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: isMobile ? 28 : 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 15),

                // Introduction Text
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.5, end: 1.0),
                  duration: Duration(seconds: 1),
                  builder: (context, double scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Text(
                        'I am a Senior Flutter Developer with over 6 years of experience in building high-quality, cross-platform mobile applications (Android/iOS) and web solutions.',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Key Skills
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.5, end: 1.0),
                  duration: Duration(seconds: 1),
                  builder: (context, double scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Text(
                        'My expertise includes:\n- Flutter/Dart, Java, PHP-MySQL, and Web Development (HTML, CSS, JS)\n- Strong understanding of UI/UX Design (Figma)\n- Automation Testing using Selenium, JMeter, and Postman',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Additional Information
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.5, end: 1.0),
                  duration: Duration(seconds: 1),
                  builder: (context, double scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Text(
                        'I’m a Certified Software Tester with a solid background in Agile methodologies, ensuring efficient, high-quality development processes.\nWith an MBA in Project Management and Leadership, I bring a strategic approach to software development, excelling in both Project Management and leadership roles.',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),

                // Conclusion & Call to Action
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.5, end: 1.0),
                  duration: Duration(seconds: 1),
                  builder: (context, double scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: Text(
                        'Passionate about solving real-world problems through technology, I continuously stay updated with the latest trends to drive innovation.\n\nLet’s connect! You can view my projects on my Portfolio and GitHub.',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}
