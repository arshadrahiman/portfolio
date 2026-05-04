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
                          iconPath: IconsUtil.email,
                          onTap: () => _launchSocial(
                              'mailto:arshadrahman.dev@gmail.com'),
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
    const url = 'https://calendly.com/software-engineer-arshadrahman';
    if (kIsWeb) {
      html.window.open(url, '_blank');
    } else {
      _launchURL(url);
    }
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
