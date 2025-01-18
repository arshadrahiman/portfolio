import 'package:arshad_dev/widgets/svg_icon_widget.dart';
import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Follow Me',
            style: TextStyle(
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
            '© 2025 Arshadul Rahman. All Rights Reserved.',
            style: TextStyle(fontSize: 14, color: Colors.white70),
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
