import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ServiceFlipCard extends StatefulWidget {
  const ServiceFlipCard({
    super.key,
    required this.cardWidth,
    required this.cardHeight,
    required this.technologies,
    required this.title,
    required this.imageName,
    this.flipColor = false,
  });

  final double cardWidth;
  final double cardHeight;
  final List<String> technologies;
  final String title;
  final String imageName;
  final bool flipColor;

  @override
  State<ServiceFlipCard> createState() => _ServiceFlipCardState();
}

class _ServiceFlipCardState extends State<ServiceFlipCard> {
  final flipController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) async {
        await flipController.toggleCard();
      },
      onExit: (_) async {
        await flipController.toggleCard();
      },
      child: FlipCard(
        controller: flipController,
        front: SizedBox(
          height: widget.cardHeight,
          width: widget.cardWidth,
          child: Container(
            decoration: BoxDecoration(
              color: widget.flipColor ? AppTheme.greyLight : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.greyLight.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Animation/Image Section (takes up the majority of space)
                Expanded(
                  child: SizedBox(
                    width: widget.cardWidth, // Fill the entire width
                    child: Image.asset(
                      "assets/animations/${widget.imageName}",
                      fit: BoxFit
                          .fill, // Stretch the image to fill the available space
                    ),
                  ),
                ),
                // Title Section (now at the bottom)
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBorderColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        back: SizedBox(
          height: widget.cardHeight,
          width: widget.cardWidth,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.flipColor
                  ? Colors.white
                  : const Color.fromARGB(255, 44, 44, 44),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final item in widget.technologies)
                  Text(
                    "• $item",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
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
