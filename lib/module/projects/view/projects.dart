import 'package:arshad_dev/theme/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final RxInt currentIndex = 0.obs;

  final List<Project> projects = [
    Project(
      title: 'E-Commerce App',
      description:
          'A full-featured e-commerce app built with Flutter. This app supports product listing, cart, and payment gateway integration.',
      image: "https://picsum.photos/200/300",
    ),
    Project(
      title: 'Portfolio Website',
      description:
          'My personal portfolio website created using Flutter, showcasing my work, skills, and services in a user-friendly design.',
      image: "https://picsum.photos/200/300",
    ),
    Project(
      title: 'Weather App',
      description:
          'A weather forecasting app using OpenWeather API. Get real-time weather data with detailed forecasts and user-friendly UI.',
      image: "https://picsum.photos/200/300",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Projects',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          // Carousel with pagination
          CarouselSlider.builder(
            itemCount: projects.length,
            itemBuilder: (context, index, realIndex) {
              final project = projects[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _buildProjectCard(context, project),
              );
            },
            options: CarouselOptions(
              height: 400,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              },
            ),
          ),
          const SizedBox(height: 20),
          // Reactive Pagination dots
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                projects.length,
                (index) => _buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the project card for each project
  Widget _buildProjectCard(BuildContext context, Project project) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0.6),
              Colors.black.withValues(alpha: 0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Image.network(
              project.image,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.4),
                    Colors.black.withValues(alpha: 0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Project: ${project.title} tapped!'),
                    ),
                  );
                },
                splashColor:
                    AppTheme.primaryBorderColor.withValues(alpha: 0.5),
                highlightColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 100,
                    color: AppTheme.greyLight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: const TextStyle(
                              color: AppTheme.primaryBorderColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            project.description,
                            style: const TextStyle(
                              color: AppTheme.grey,
                              fontSize: 16,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reactive dot indicator
  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex.value == index
            ? AppTheme.primaryBorderColor
            : AppTheme.grey.withValues(alpha: 0.5),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String image;

  Project({
    required this.title,
    required this.description,
    required this.image,
  });
}
