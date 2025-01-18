import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects = [
    Project(
        title: 'E-Commerce App',
        description: 'A full-featured e-commerce app built with Flutter.',
        image: "https://picsum.photos/200/300"),
    Project(
        title: 'Portfolio Website',
        description: 'My personal portfolio website created using Flutter.',
        image: "https://picsum.photos/200/300"),
    Project(
        title: 'Weather App',
        description: 'A weather forecasting app using OpenWeather API.',
        image: "https://picsum.photos/200/300"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return ProjectCard(project: project);
            },
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                project.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    project.description,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String image;

  Project(
      {required this.title, required this.description, required this.image});
}
