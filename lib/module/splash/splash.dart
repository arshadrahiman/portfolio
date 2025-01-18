import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.flutter_dash, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            CircularProgressIndicator(), // Show loading spinner
          ],
        ),
      ),
    );
  }
}
