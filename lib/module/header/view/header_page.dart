import 'package:arshad_dev/main.dart';
import 'package:arshad_dev/utils/image_utils.dart';
import 'package:arshad_dev/widgets/animation.dart';
import 'package:flutter/material.dart';
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
          colors: [Colors.blue.shade900, Colors.purple.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(ImageUtil.profile),
              // shadowColor: Colors.black,
              // elevation: 8,
            ),
            SizedBox(height: 20),
            Text(
              'Arshadul Rahman',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            AnimatedTextWidget(), // Assuming AnimatedTextWidget is already defined
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => openConsultationLink(),
              child: Text('Let\'s Talk About Your Next Project'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: StadiumBorder(),
                elevation: 5,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
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
