import 'dart:async';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/widgets/service_flipcard.dart';
import 'package:arshad_dev/widgets/techstack_widg.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ServiceDesktopWidget extends StatefulWidget {
  const ServiceDesktopWidget({super.key});

  @override
  State<ServiceDesktopWidget> createState() => _ServiceDesktopWidgetState();
}

class _ServiceDesktopWidgetState extends State<ServiceDesktopWidget> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer for auto-sliding every 3 seconds
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    // Dispose the timer when the widget is disposed to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600; // Set mobile breakpoint

    return Container(
      color: AppTheme.black,
      height: height,
      width: width,
      child: Column(
        children: [
          Text(
            "What I can do ?",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle Desktop Layout: Horizontal scroll
                if (!isMobile)
                  SizedBox(
                    height: height * 0.40,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: 300,
                            technologies: const [
                              "Flutter",
                              "Kotlin",
                              " Jetpack Compose"
                            ],
                            title: 'Mobile App Development',
                            imageName: 'mobile.gif',
                          ),
                          SizedBox(width: width * 0.05),
                          ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: 300,
                            technologies: const [
                              "Node.js",
                              "Spring Boot",
                              "Firebase",
                              "AWS",
                              "GCP"
                            ],
                            title: 'Backend Development',
                            imageName: 'backend.gif',
                          ),
                          SizedBox(width: width * 0.05),
                          ServiceFlipCard(
                            cardHeight: height * 0.40,
                            cardWidth: 300,
                            technologies: const [
                              "Flutter",
                              "Html",
                              "Css",
                              "Javascript",
                              "Bootstrap",
                              "React js"
                            ],
                            title: 'Web Development',
                            imageName: 'web.gif',
                          ),
                        ],
                      ),
                    ),
                  ),
                // Handle Mobile Layout: PageView (Carousel)
                if (isMobile)
                  SizedBox(
                    height: height * 0.40,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        ServiceFlipCard(
                          cardHeight: height * 0.40,
                          cardWidth: width,
                          technologies: const [
                            "Flutter",
                            "Kotlin",
                            " Jetpack Compose"
                          ],
                          title: 'Mobile App Development',
                          imageName: 'mobile.gif',
                        ),
                        ServiceFlipCard(
                          cardHeight: height * 0.40,
                          cardWidth: width,
                          technologies: const [
                            "Node.js",
                            "Spring Boot",
                            "Firebase",
                            "AWS",
                            "GCP"
                          ],
                          title: 'Backend Development',
                          imageName: 'backend.gif',
                        ),
                        ServiceFlipCard(
                          cardHeight: height * 0.40,
                          cardWidth: width,
                          technologies: const [
                            "Flutter",
                            "Html",
                            "Css",
                            "Javascript",
                            "Bootstrap",
                            "React js"
                          ],
                          title: 'Web Development',
                          imageName: 'web.gif',
                        ),
                      ],
                    ),
                  ),
                // Display pagination for mobile (dots indicator)
                if (isMobile)
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: TechStackAutoScrollWidget(
              imageHeight: height * 0.1,
              titleFontSize: 34,
              scrollSeconds: 7,
            ),
          ),
        ],
      ),
    );
  }
}
