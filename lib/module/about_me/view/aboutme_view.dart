import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/widgets/scroll_reveal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Color(0xFF0A0A0A)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title with accent line
          ScrollReveal(
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBorderColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'About Me',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Glassmorphism card
          ScrollReveal(
            delay: const Duration(milliseconds: 300),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.all(isMobile ? 20 : 32),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I am a dedicated Cross-platform App Developer and Software Lead with over 7 years of experience in Software Development and Testing. I specialize in building robust, scalable solutions using Flutter and Dart, with a solid history of delivering high-quality software for international clients.',
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 24),
  
                      // Skill tags row
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: const [
                          _SkillTag('Flutter / Dart'),
                          _SkillTag('Native Android (Kotlin)'),
                          _SkillTag('iOS (Swift)'),
                          _SkillTag('GetX / Bloc / Riverpod'),
                          _SkillTag('Firebase Integration'),
                          _SkillTag('REST APIs / JWT'),
                          _SkillTag('WebRTC / SignalR'),
                          _SkillTag('Method Channel'),
                          _SkillTag('CI/CD Pipelines'),
                          _SkillTag('QA & Automation Testing'),
                        ],
                      ),
  
                      const SizedBox(height: 24),
                      Text(
                        'Currently leading the mobile development team at Mobcoder (Tawuniya Insurance) in Riyadh, where I drive architecture decisions and manage release processes. With an MBA in Project Leadership and Management, I blend technical expertise with strategic leadership to accomplish critical milestones.',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Passionate about solving real-world problems through technology, I continuously stay updated with the latest trends to drive innovation.',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w400,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Small skill tag chip with subtle border
class _SkillTag extends StatelessWidget {
  final String label;

  const _SkillTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppTheme.primaryBorderColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.primaryBorderColor.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
