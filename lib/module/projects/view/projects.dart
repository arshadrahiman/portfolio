import 'package:arshad_dev/theme/app_theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProjectsSection extends StatefulWidget {
  @override
  _ProjectsSectionState createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int _currentIndex = 0; // Track the current page index

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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          // Carousel with pagination
          CarouselSlider.builder(
            itemCount: projects.length,
            itemBuilder: (context, index, realIndex) {
              final project = projects[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: _buildProjectCard(context, project),
              );
            },
            options: CarouselOptions(
              height: 400,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index; // Update current index
                });
              },
            ),
          ),
          SizedBox(height: 20),
          // Custom Pagination
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              projects.length,
              (index) => _buildDot(index),
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
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.2)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            // Project image
            Image.network(
              project.image,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
            // Gradient overlay
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Transparent pink overlay beneath title and description
            Positioned(
              bottom: 10, // Adjusted to position under the text content
              left: 20,
              right: 20,
              child: InkWell(
                onTap: () {
                  // Handle tap (e.g., show a snackbar or navigate to another screen)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Project: ${project.title} tapped!'),
                    ),
                  );
                },
                splashColor: AppTheme.primaryBorderColor
                    .withOpacity(0.5), // Splash color
                highlightColor: Colors.transparent, // Disable highlight color
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Curved corners
                  child: Container(
                    height: 100, // A fixed height for the overlay
                    color: AppTheme.greyLight, // Transparent pink
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: TextStyle(
                              color: AppTheme.primaryBorderColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Description with more padding
                          Text(
                            project.description,
                            style: TextStyle(
                              color: AppTheme.grey,
                              fontSize: 16,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis, // Prevent overflow
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

  // Method to build each dot in the pagination
  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index
            ? AppTheme.primaryBorderColor
            : AppTheme.grey.withOpacity(0.5),
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
