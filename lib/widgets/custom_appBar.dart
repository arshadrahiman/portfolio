import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      Size.fromHeight(60); // Set the height of the app bar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        // Navigation Menu (With Hover Effect for Web)
        Row(
          children: [
            _buildMenuItem('About', ""),
            SizedBox(width: 20),
            _buildMenuItem('Projects', ""),
            SizedBox(width: 20),
            _buildMenuItem('Contact', ""),
            SizedBox(width: 20),
            _buildMenuItem('Blog', ""), // You can add more sections here
            SizedBox(width: 20),
            SizedBox(width: 20),
          ],
        ),
      ],
    );
  }

  // Method to create each menu item with hover effect (using StatefulWidget)
  Widget _buildMenuItem(String title, String icon) {
    return _MenuItem(
      title: title,
      icon: icon,
    );
  }
}

class _MenuItem extends StatefulWidget {
  final String title;
  final String icon;

  const _MenuItem({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () {
          // Handle navigation on tap
          print('Navigate to ${widget.title}');
        },
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0, // Scale up when hovered
          duration: Duration(milliseconds: 200),
          child: Row(
            children: [
              SvgPicture.asset(widget.icon),
              Text(
                widget.title,
                style: TextStyle(
                  color: _isHovered
                      ? Colors.blueAccent
                      : Colors.white, // Change color on hover
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
