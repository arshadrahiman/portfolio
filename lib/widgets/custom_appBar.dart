import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onActionPressed;

  CustomAppBar({
    required this.onActionPressed,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(60); // Set the height of the app bar

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // this will hide Drawer hamburger icon
      actions: <Widget>[Container()], // this will hide endDrawer hamburger icon

      backgroundColor: Colors.transparent,
      elevation: 0,
      title: LayoutBuilder(
        builder: (context, constraints) {
          // If the screen width is less than 600, show the hamburger menu (IconButton)
          if (constraints.maxWidth < 600) {
            return Row(
              mainAxisAlignment:
                  MainAxisAlignment.end, // Align to the left side
              children: [
                // Hamburger menu icon for mobile view
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    _openDrawer(context);
                  },
                ),
              ],
            );
          } else {
            // If the screen width is greater than or equal to 600, show the menu items in a row
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buildMenuItem('About', onActionPressed),
                SizedBox(width: 20),
                buildMenuItem('Projects', onActionPressed),
                SizedBox(width: 20),
                buildMenuItem('Contact', onActionPressed),
                SizedBox(width: 20),
                buildMenuItem('Blog', onActionPressed),
                SizedBox(width: 20),
              ],
            );
          }
        },
      ),
    );
  }

  // Function to open the Drawer (for mobile view)
  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
    final PortfolioController controller = Get.put(PortfolioController());
    // controller.isDrawer.value = true;
  }
}

// Method to create each menu item
Widget buildMenuItem(String title, Function(String) onActionPressed) {
  return _MenuItem(
    title: title,
    onActionPressed: onActionPressed,
  );
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
          widget.onActionPressed(widget.title.toLowerCase());
        },
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0,
          duration: Duration(milliseconds: 200),
          child: Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: _isHovered ? Colors.blueAccent : Colors.white,
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
