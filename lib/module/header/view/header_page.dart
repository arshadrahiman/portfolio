import 'package:arshad_dev/utils/constants.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/utils/icon_utils.dart';
import 'package:arshad_dev/utils/image_utils.dart';
import 'package:arshad_dev/widgets/animation.dart';
import 'package:arshad_dev/widgets/hover%20button.dart';
import 'package:arshad_dev/widgets/svg_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html show window;
import 'dart:ui';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        // Subtle radial gradient background
        gradient: RadialGradient(
          center: Alignment(0.0, -0.3),
          radius: 1.2,
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF0D0D0D),
            Colors.black,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Image with glow ring
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryBorderColor
                              .withValues(alpha: 0.3),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: isMobile ? 55 : 70,
                      backgroundColor: AppTheme.primaryBorderColor,
                      child: CircleAvatar(
                        radius: isMobile ? 52 : 67,
                        backgroundImage: AssetImage(ImageUtil.profile),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Greeting + Name with gradient accent
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Hi, I\'m ',
                        style: TextStyle(
                          fontSize: isMobile ? 28 : 40,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Arshad Rahman',
                            style: TextStyle(
                              fontSize: isMobile ? 28 : 40,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.white,
                            ),
                          ),
                          TextSpan(
                            text: '.',
                            style: TextStyle(
                              fontSize: isMobile ? 50 : 80,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryBorderColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Fullstack Software Developer | 7+ Years Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 16 : 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AnimatedTextWidget(),

                  const SizedBox(height: 40),

                  // Social Buttons with hover glow
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialButton(
                          iconPath: IconsUtil.github,
                          onTap: () =>
                              _launchSocial('https://github.com/arshadrahiman'),
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          iconPath: IconsUtil.linkedin,
                          isSvg: false,
                          onTap: () => _launchSocial(
                              'https://www.linkedin.com/in/arshadul-rahman'),
                        ),
                        const SizedBox(width: 16),
                        _SocialButton(
                          iconPath: IconsUtil.insta,
                          iconColor: const Color(0xFFE1306C), // Instagram Brand Color
                          onTap: () => _launchSocial(
                              'https://instagram.com/arshad_rahiman'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // CTA Button
                  HoverButton(
                    fnBtn: () => openConsultationLink(),
                    buttonText: "Contact Me",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void openConsultationLink() {
    Get.dialog(
      Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E).withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: AppTheme.primaryBorderColor.withValues(alpha: 0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBorderColor.withValues(alpha: 0.15),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBorderColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.handshake_rounded,
                      color: AppTheme.primaryBorderColor,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Let's Connect",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "How would you like to reach out?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _ContactOption(
                    icon: Icons.video_camera_front_rounded,
                    title: "1:1 Meeting",
                    subtitle: "Schedule via Calendly",
                    onTap: () {
                      Get.back();
                      _launchSocial('https://calendly.com/software-engineer-arshadrahman');
                    },
                  ),
                  const SizedBox(height: 16),
                  _ContactOption(
                    icon: Icons.chat_rounded,
                    title: "WhatsApp Chat",
                    subtitle: "Direct message",
                    onTap: () {
                      Get.back();
                      // Update with your actual phone number
                      _launchSocial('https://wa.me/');
                    },
                  ),
                  const SizedBox(height: 16),
                  _ContactOption(
                    icon: Icons.email_rounded,
                    title: "Email",
                    subtitle: "Drop a message",
                    onTap: () {
                      Get.back();
                      _launchSocial('mailto:arshadrahman.dev@gmail.com');
                    },
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierColor: Colors.black.withValues(alpha: 0.6),
    );
  }

  void _launchSocial(String url) {
    if (kIsWeb) {
      html.window.open(url, '_blank');
    } else {
      _launchURL(url);
    }
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  final bool isSvg;
  final Color? iconColor;

  const _SocialButton({
    required this.iconPath,
    required this.onTap,
    this.isSvg = true,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: isHovered.value
                  ? Colors.white.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isHovered.value
                    ? AppTheme.primaryBorderColor.withValues(alpha: 0.6)
                    : Colors.grey.withValues(alpha: 0.3),
                width: 1.5,
              ),
              boxShadow: isHovered.value
                  ? [
                      BoxShadow(
                        color:
                            AppTheme.primaryBorderColor.withValues(alpha: 0.25),
                        blurRadius: 12,
                        spreadRadius: 1,
                      ),
                    ]
                  : [],
            ),
            child: isSvg
                ? Center(
                    child: SvgIcon(
                      iconPath,
                      color: iconColor ?? Colors.white,
                      size: 22,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      iconPath,
                      fit: BoxFit.contain,
                      color: iconColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _ContactOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isHovered.value
                  ? AppTheme.primaryBorderColor.withValues(alpha: 0.1)
                  : Colors.white.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isHovered.value
                    ? AppTheme.primaryBorderColor.withValues(alpha: 0.5)
                    : Colors.white.withValues(alpha: 0.1),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBorderColor.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: AppTheme.primaryBorderColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: isHovered.value
                      ? AppTheme.primaryBorderColor
                      : Colors.white54,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
