import 'package:arshad_dev/widgets/svg_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'follow_me'.tr,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconButton('assets/linkedin.svg', 'LinkedIn'),
              SizedBox(width: 20),
              _buildIconButton('assets/github.svg', 'GitHub'),
              SizedBox(width: 20),
              _buildIconButton('assets/twitter.svg', 'Twitter'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'rights_reserved'.tr,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(String assetPath, String label) {
    return IconButton(
      icon: SvgIcon(
        assetPath,
        color: Colors.white,
        size: 35,
      ),
      onPressed: () {
        print('$label button pressed');
      },
    );
  }
}
