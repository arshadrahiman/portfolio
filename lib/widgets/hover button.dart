import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HoverButton extends StatelessWidget {
  final VoidCallback fnBtn;
  final String buttonText;

  const HoverButton({
    super.key,
    required this.fnBtn,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isHovered = false.obs;

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: isHovered.value
                ? [
                    BoxShadow(
                      color: AppTheme.primaryBorderColor.withValues(alpha: 0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: ElevatedButton(
            onPressed: fnBtn,
            style: ElevatedButton.styleFrom(
              foregroundColor: isHovered.value ? Colors.white : Colors.white70,
              backgroundColor: isHovered.value
                  ? AppTheme.primaryBorderColor
                  : Colors.white.withValues(alpha: 0.05),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(
                  color: isHovered.value
                      ? AppTheme.primaryBorderColor
                      : Colors.white.withValues(alpha: 0.2),
                  width: 1.5,
                ),
              ),
              elevation: 0,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}
