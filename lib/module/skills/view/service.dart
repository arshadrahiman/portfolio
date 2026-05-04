import 'package:arshad_dev/module/skills/controller/service_controller.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/widgets/service_flipcard.dart';
import 'package:arshad_dev/widgets/techstack_widg.dart';
import 'package:arshad_dev/widgets/scroll_reveal.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'dart:ui';

class ServiceDesktopWidget extends GetView<ServiceController> {
  const ServiceDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0A0A0A), // Slight off-black for depth
        image: DecorationImage(
          image: AssetImage('assets/images/noise.png'), // If you have a noise texture, otherwise this safely fails or can be ignored. Actually, better to use gradients
          fit: BoxFit.cover,
          opacity: 0.05,
        ),
      ),
      width: width,
      child: Column(
        children: [
          const Gap(60),
          // Section Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.primaryBorderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "What I can do",
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.primaryBorderColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          const Gap(40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Desktop Layout: Horizontal scroll
                if (!isMobile)
                  SizedBox(
                    height: height * 0.45,
                    child: Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScrollReveal(
                              delay: const Duration(milliseconds: 100),
                              child: _buildServiceCardWrap(
                                child: ServiceFlipCard(
                                  cardHeight: height * 0.40,
                                  cardWidth: 320,
                                  technologies: const [
                                    "Flutter",
                                    "Dart",
                                    "Kotlin",
                                    "Swift",
                                    "GetX / Bloc / Riverpod",
                                    "Method Channel"
                                  ],
                                  title: 'Mobile App Development',
                                  imageName: 'mobile.gif',
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            ScrollReveal(
                              delay: const Duration(milliseconds: 300),
                              child: _buildServiceCardWrap(
                                child: ServiceFlipCard(
                                  cardHeight: height * 0.40,
                                  cardWidth: 320,
                                  technologies: const [
                                    "Firebase / Firestore",
                                    "REST APIs / JWT",
                                    "Odoo API",
                                    "SignalR / WebRTC",
                                    "Data Encryption"
                                  ],
                                  title: 'Backend & Real-time Integration',
                                  imageName: 'backend.gif',
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            ScrollReveal(
                              delay: const Duration(milliseconds: 500),
                              child: _buildServiceCardWrap(
                                child: ServiceFlipCard(
                                  cardHeight: height * 0.40,
                                  cardWidth: 320,
                                  technologies: const [
                                    "React / Next.js",
                                    "Flutter Web",
                                    "Node.js / Express",
                                    "Responsive Design",
                                    "SEO & Performance",
                                    "HTML5 / CSS3 / Tailwind"
                                  ],
                                  title: 'Web Development',
                                  imageName: 'web.gif',
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            ScrollReveal(
                              delay: const Duration(milliseconds: 700),
                              child: _buildServiceCardWrap(
                                child: ServiceFlipCard(
                                  cardHeight: height * 0.40,
                                  cardWidth: 320,
                                  technologies: const [
                                    "Selenium / Appium",
                                    "JMeter / Postman",
                                    "Robot Framework",
                                    "CI/CD (Azure / App Center)",
                                    "QA & Automation"
                                  ],
                                  title: 'Software Testing & DevOps',
                                  imageName: 'https://cdn.dribbble.com/users/1162077/screenshots/3848914/tester.gif',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                // Mobile Layout: PageView (Carousel)
                if (isMobile)
                  SizedBox(
                    height: height * 0.45,
                    child: PageView(
                      controller: controller.pageController,
                      onPageChanged: controller.onPageChanged,
                      children: [
                        _buildServiceCardWrap(
                          child: ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: width * 0.85,
                            technologies: const [
                              "Flutter",
                              "Dart",
                              "Kotlin",
                              "Swift",
                              "GetX / Bloc / Riverpod",
                              "Method Channel"
                            ],
                            title: 'Mobile App Development',
                            imageName: 'mobile.gif',
                          ),
                        ),
                        _buildServiceCardWrap(
                          child: ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: width * 0.85,
                            technologies: const [
                              "Firebase / Firestore",
                              "REST APIs / JWT",
                              "Odoo API",
                              "SignalR / WebRTC",
                              "Data Encryption"
                            ],
                            title: 'Backend Integration',
                            imageName: 'backend.gif',
                          ),
                        ),
                        _buildServiceCardWrap(
                          child: ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: width * 0.85,
                            technologies: const [
                              "React / Next.js",
                              "Flutter Web",
                              "Node.js / Express",
                              "Responsive Design",
                              "SEO & Performance",
                              "HTML5 / CSS3 / Tailwind"
                            ],
                            title: 'Web Development',
                            imageName: 'web.gif',
                          ),
                        ),
                        _buildServiceCardWrap(
                          child: ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: width * 0.85,
                            technologies: const [
                              "Selenium / Appium",
                              "JMeter / Postman",
                              "Robot Framework",
                              "CI/CD Pipelines",
                              "QA & Automation"
                            ],
                            title: 'Software Testing',
                            imageName: 'https://cdn.dribbble.com/users/1162077/screenshots/3848914/tester.gif',
                          ),
                        ),
                      ],
                    ),
                  ),
                // Pagination dots for mobile
                if (isMobile)
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          final isActive = controller.currentPage.value == index;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: isActive ? 24 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: isActive
                                  ? AppTheme.primaryBorderColor
                                  : Colors.grey.withValues(alpha: 0.3),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Gap(40),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              border: Border(
                top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
              child: TechStackAutoScrollWidget(
                imageHeight: height * 0.08,
                titleFontSize: 28,
                scrollSeconds: 15,
              ),
            ),
          ),
          const Gap(40),
        ],
      ),
    );
  }

  // Wrapper for the service card to add a glowing shadow effect
  Widget _buildServiceCardWrap({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBorderColor.withValues(alpha: 0.15),
            blurRadius: 20,
            spreadRadius: -5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
