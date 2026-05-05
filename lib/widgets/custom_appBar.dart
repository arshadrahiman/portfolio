import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/widgets/hover%20button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(String) onActionPressed;

  const CustomAppBar({
    super.key,
    required this.onActionPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: <Widget>[Container()],
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    _openDrawer(context);
                  },
                ),
              ],
            );
          } else {
            return ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Container(
                height: kToolbarHeight,
                width: MediaQuery.of(context).size.width - 100,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 44, 44, 44),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _MenuItem(title: 'Home', onActionPressed: onActionPressed),
                    _MenuItem(title: 'About', onActionPressed: onActionPressed),
                    _MenuItem(title: 'Services', onActionPressed: onActionPressed),
                    _MenuItem(title: 'Projects', onActionPressed: onActionPressed),
                    _MenuItem(title: 'Certifications', onActionPressed: onActionPressed),
                    _MenuItem(title: 'Qualifications', onActionPressed: onActionPressed),
                    _MenuItem(title: 'Experience', onActionPressed: onActionPressed),
                    _MenuItem(title: 'Contact', onActionPressed: onActionPressed),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: HoverButton(
                        fnBtn: () => _openResume(),
                        buttonText: 'Resume',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _openResume() {
    // Placeholder URL for Resume - User should update this
    const url =
        'https://drive.google.com/file/d/1g8Nwdk0f7Kc_M4VIYhcoMtNLDw-iLdXV/view?usp=share_link';
    if (kIsWeb) {
      // Use html.window.open if we can, or just launchUrl
      launchUrl(Uri.parse(url));
    } else {
      launchUrl(Uri.parse(url));
    }
  }

  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
    Get.find<PortfolioController>().isDrawer.value = true;
  }
}

/// Menu item widget using GetX reactive hover state instead of setState
class _MenuItem extends StatelessWidget {
  final String title;
  final Function(String) onActionPressed;

  const _MenuItem({
    required this.title,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTap: () {
          onActionPressed(title.toLowerCase());
        },
        child: Obx(
          () => AnimatedScale(
            scale: isHovered.value ? 1.2 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isHovered.value
                        ? AppTheme.primaryBorderColor
                        : AppTheme.greyLight,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
