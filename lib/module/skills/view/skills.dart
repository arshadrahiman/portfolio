import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 80,
      ),
      decoration: const BoxDecoration(
        color: Colors.black,
        // Subtle background pattern or gradient could go here
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                'Professional Skills',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          
          // Container for the skills with a subtle glassmorphism effect
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.03),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
            child: Wrap(
              spacing: 16,
              runSpacing: 20,
              children: const [
                SkillChip('Flutter'),
                SkillChip('Dart'),
                SkillChip('Firebase'),
                SkillChip('REST API'),
                SkillChip('GraphQL'),
                SkillChip('UI/UX Design'),
                SkillChip('Git / GitHub'),
                SkillChip('GetX / Provider / Riverpod'),
                SkillChip('Flutter Animations'),
                SkillChip('Flutter Testing'),
                SkillChip('Web & Desktop Support'),
                SkillChip('Responsive UI'),
                SkillChip('CI/CD Pipelines'),
                SkillChip('Native Android (Kotlin)'),
                SkillChip('Performance Optimization'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip(this.skill, {super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isHovered = false.obs;

    return Obx(
      () => MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutQuart,
          transform: Matrix4.translationValues(0, isHovered.value ? -4 : 0, 0),
          decoration: BoxDecoration(
            color: isHovered.value
                ? AppTheme.primaryBorderColor.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: isHovered.value
                  ? AppTheme.primaryBorderColor.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
            boxShadow: isHovered.value
                ? [
                    BoxShadow(
                      color: AppTheme.primaryBorderColor.withValues(alpha: 0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: isHovered.value ? Colors.white : Colors.grey[300],
              fontSize: 16,
              fontWeight: isHovered.value ? FontWeight.w600 : FontWeight.w500,
              letterSpacing: 0.5,
            ),
            child: Text(skill),
          ),
        ),
      ),
    );
  }
}
