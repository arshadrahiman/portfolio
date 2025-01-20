import 'dart:async';
import 'package:arshad_dev/widgets/hover%20button.dart';
import 'package:flutter/material.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String githubUrl;
  final String? figmaUrl;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
    this.figmaUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double descriptionFontSize = width > 800 ? 18 : 16;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: width * 0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.white,
                      ),
                    ),
                    // Use TextOverflow.ellipsis and a responsive font size
                    Text(
                      description,
                      maxLines: 3, // Limit to 3 lines
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis when text overflows
                      style: TextStyle(
                        fontSize: descriptionFontSize,
                        color: AppTheme.greyLight,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Open GitHub link
                    launchURL(githubUrl);
                  },
                  child: Text('GitHub'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey.withOpacity(0.9),
                    backgroundColor: Colors.grey.withOpacity(0.3),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: StadiumBorder(),
                    elevation: 5,
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              if (figmaUrl != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Open Figma link if available
                      launchURL(figmaUrl!);
                    },
                    child: Text('Figma'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.grey.withOpacity(0.9),
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: StadiumBorder(),
                      elevation: 5,
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  // Helper function to launch URLs
  void launchURL(String url) {
    // This can be enhanced with a package like url_launcher to open the link in a browser
    // Example: launch(url);
  }
}

class NavigationButtons extends StatelessWidget {
  final PageController pageController;

  const NavigationButtons({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              int page = pageController.positions.length + 1;
              if (pageController.page != null) {
                if (pageController.page != 0) {
                  page = int.parse(pageController.page.toString()) - 1;
                }
              }

              pageController.animateToPage(page,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
            icon: const Icon(
              CupertinoIcons.arrow_left,
              size: 30,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              int page = 0;
              if (pageController.page != null) {
                if (pageController.page !=
                    pageController.positions.length + 1) {
                  page = int.parse(pageController.page.toString()) + 1;
                }
              }

              pageController.animateToPage(page,
                  duration: const Duration(seconds: 1), curve: Curves.easeIn);
            },
            icon: const Icon(
              CupertinoIcons.arrow_right,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectDesktopWidget extends StatefulWidget {
  final PageController pageController = PageController();

  @override
  State<ProjectDesktopWidget> createState() => _ProjectDesktopWidgetState();
}

class _ProjectDesktopWidgetState extends State<ProjectDesktopWidget> {
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      widget.pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: AppTheme.black.withOpacity(0.5),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Projects",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Gap(20),
          SizedBox(
            height: height * 0.6,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                PageView(
                  controller: widget.pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    ProjectCard(
                      title: "ChityChat App",
                      description:
                          "A real-time messaging app built with Firebase and GetX for state management. Includes features like push notifications and chat functionalities.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl: "https://github.com/yourusername/ChityChat",
                    ),
                    ProjectCard(
                      title: "Ecommerce App",
                      description:
                          "An e-commerce app with Firebase backend, RazorPay integration for payments, and GetX for state management. The app also includes local database storage for offline support.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl: "https://github.com/yourusername/EcommerceApp",
                    ),
                    ProjectCard(
                      title: "Money Manager App",
                      description:
                          "A money management app built with Firebase and GetX. Features include push notifications, localization, currency conversion, and a local database.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl:
                          "https://github.com/yourusername/MoneyManagerApp",
                    ),
                    ProjectCard(
                      title: "Trivia Quiz App",
                      description:
                          "A trivia quiz app using a trivia API and GetX for state management. Includes different categories and real-time quiz functionalities.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl:
                          "https://github.com/yourusername/TriviaQuizApp",
                    ),
                    ProjectCard(
                      title: "Weather App",
                      description:
                          "A weather app using a weather API, location services, and connectivity management to show current weather conditions.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl: "https://github.com/yourusername/WeatherApp",
                    ),
                    ProjectCard(
                      title: "Personal Portfolio",
                      description:
                          "My personal portfolio website showcasing my skills, projects, and experience. Built using HTML, CSS, and JavaScript.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl: "https://github.com/yourusername/Portfolio",
                      figmaUrl: "https://www.figma.com/file/portfolio-link",
                    ),
                    ProjectCard(
                      title: "Portfolio and Blog",
                      description:
                          "My portfolio and blog site where I share my thoughts and projects. Built using HTML, CSS, and JavaScript.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl:
                          "https://github.com/yourusername/PortfolioBlog",
                    ),
                    ProjectCard(
                      title: "JS Calculator",
                      description:
                          "A simple calculator built using JavaScript. Includes basic arithmetic operations and a user-friendly UI.",
                      imageUrl: "https://picsum.photos/200/300",
                      githubUrl: "https://github.com/yourusername/JsCalculator",
                    ),
                  ],
                ),
                NavigationButtons(pageController: widget.pageController),
              ],
            ),
          ),
          const Gap(20),
          // Wrap SmoothPageIndicator in a Center widget for centering
          Center(
            child: SmoothPageIndicator(
              controller: widget.pageController,
              count: 7, // Updated to reflect the number of projects
              effect: WormEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: AppTheme.primaryBorderColor,
                dotColor: AppTheme.greyLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
