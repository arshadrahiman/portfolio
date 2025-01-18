import 'package:arshad_dev/utils/image_utils.dart';
import 'package:arshad_dev/widgets/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:url_launcher/url_launcher.dart'; // For mobile

// Conditional import for web platform (dart:html)
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html
    show window; // For Web (Importing only the necessary part)

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(ImageUtil.profile),
              ),
              SizedBox(height: 20),

              // Name and Introduction Text
              RichText(
                text: TextSpan(
                  text:
                      'Hi, ', // You can split the text here if you want different styles for different parts
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'I\'m ',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Arshadul Rahman',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: '.',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedTextWidget(), // Assuming AnimatedTextWidget is already defined

              SizedBox(height: 40), // Added spacing before buttons

              // Social Buttons (Row layout for responsiveness)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // GitHub Button
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.github,
                      title: 'GitHub',
                    ),
                    SizedBox(width: 20),

                    // Email Button
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.email,
                      title: 'Email',
                    ),
                    SizedBox(width: 20),

                    // Twitter Button
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.twitter,
                      title: 'Twitter',
                    ),
                    SizedBox(width: 20),

                    // Instagram Button
                    FlutterSocialButton(
                      onTap: () {},
                      mini: true,
                      buttonType: ButtonType.instagram,
                      title: 'Instagram',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30), // Added spacing before 'Let's Talk' button

              // 'Let's Talk' button
              ElevatedButton(
                onPressed: () => openConsultationLink(),
                child: Text('Let\'s Talk About Your Next Project'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: StadiumBorder(),
                  elevation: 5,
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openConsultationLink() {
    const url = 'https://calendly.com/software-engineer-arshadrahman';

    if (kIsWeb) {
      html.window.open(url, '_blank');
    } else {
      _launchURL(url);
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
