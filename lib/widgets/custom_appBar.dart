import 'package:arshad_dev/baseclass/basecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// CustomAppBar that accepts a callback to handle scrolling
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
            _buildMenuItem('About', (v) {}),
            SizedBox(width: 20),
            _buildMenuItem('Projects', (v) {}),
            SizedBox(width: 20),
            _buildMenuItem('Contact', (v) {}),
            SizedBox(width: 20),
            _buildMenuItem('Blog', (v) {}), // You can add more sections here
            SizedBox(width: 20),
            _buildMenuItem('E', (v) {
              BaseController.changeLanguage();
            }), // You can add more sections here
          ],
        ),
      ],
    );
  }

  // Method to create each menu item with hover effect (using StatefulWidget)
  Widget _buildMenuItem(String title, Function(String) onActionPressed) {
    return _MenuItem(
      title: title,
      onActionPressed: onActionPressed,
    );
  }
}

class _MenuItem extends StatefulWidget {
  final String title;
  final Function(String) onActionPressed;

  const _MenuItem(
      {Key? key, required this.title, required this.onActionPressed})
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
          widget.onActionPressed(widget.title.toLowerCase());
        },
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0, // Scale up when hovered
          duration: Duration(milliseconds: 200),
          child: Row(
            children: [
              // You can optionally add icons here with `widget.icon`
              // SvgPicture.asset(widget.icon),
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
