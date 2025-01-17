import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arshad_dev/utils/image_utils.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart'; // For mobile

// Conditional import for web platform (dart:html)
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html
    show window; // For Web (Importing only the necessary part)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arshad Rahman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.grey[800]),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            HeroSection(),
            // About Me Section
            AboutMeSection(),
            // Skills Section
            SkillsSection(),
            // Projects Section
            ProjectsSection(),
            // Contact Section
            ContactSection(),
            // Footer Section
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.purple.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(ImageUtil.profile),
              // shadowColor: Colors.black,
              // elevation: 8,
            ),
            SizedBox(height: 20),
            Text(
              'Arshadul Rahman',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            AnimatedTextWidget(), // Assuming AnimatedTextWidget is already defined
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => openConsultationLink(),
              child: Text('Let\'s Talk About Your Next Project'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: StadiumBorder(),
                elevation: 5,
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void openConsultationLink() {
    const url = 'https://calendly.com/software-engineer-arshadrahman';

    if (kIsWeb) {
      html.window.open(url, '_blank');
    } else {
      _launchURL(url);
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 800;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: isMobile ? 28 : 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 15),
              Text(
                'I am a passionate Flutter developer with 6+ years of experience in building mobile applications.',
                style: TextStyle(
                    fontSize: isMobile ? 16 : 18, color: Colors.grey[800]),
              ),
              SizedBox(height: 20),
              Text(
                'I specialize in creating beautiful, responsive, and user-friendly apps using Flutter and Dart. '
                'My goal is to make mobile experiences more intuitive and seamless.',
                style: TextStyle(
                    fontSize: isMobile ? 14 : 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.blue[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              SkillChip('Flutter'),
              SkillChip('Dart'),
              SkillChip('Firebase'),
              SkillChip('GraphQL'),
              SkillChip('REST API'),
              SkillChip('UI/UX Design'),
              SkillChip('Git'),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  SkillChip(this.skill);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        skill,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: Colors.blue.shade700,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

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
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      project.description,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
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

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _message = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Form Submitted!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      padding: EdgeInsets.all(40),
      color: Colors.blue[50],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800]),
          ),
          SizedBox(height: 15),
          Text(
            'Feel free to reach out to me for collaborations, job offers, or any exciting opportunities!',
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
          SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.blue[800]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your name' : null,
                  onChanged: (value) => _name = value,
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.blue[800]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  validator: (value) => value!.isEmpty ||
                          !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                              .hasMatch(value)
                      ? 'Please enter a valid email address'
                      : null,
                  onChanged: (value) => _email = value,
                ),
                SizedBox(height: 15),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    labelStyle: TextStyle(color: Colors.blue[800]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your message' : null,
                  onChanged: (value) => _message = value,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Send Message'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue[800],
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: StadiumBorder(),
                    elevation: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: Colors.blueAccent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Follow Me',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIconButton('assets/linkedin.svg', 'LinkedIn'),
              SizedBox(width: 20),
              _buildIconButton('assets/github.svg', 'GitHub'),
              SizedBox(width: 20),
              _buildIconButton('assets/twitter.svg', 'Twitter'),
            ],
          ),
          SizedBox(height: 20),
          Text(
            '© 2025 Arshadul Rahman. All Rights Reserved.',
            style: TextStyle(fontSize: 14, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(String assetPath, String label) {
    return IconButton(
      icon: SvgPicture.asset(
        assetPath,
        width: 35,
        height: 35,
        color: Colors.white,
      ),
      onPressed: () {
        print('$label button pressed');
      },
    );
  }
}

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  final List<String> textList = [
    'Tech Lead', // A leadership/management role in the tech field
    'Senior Flutter Developer', // Specialized senior developer role
    'Full Stack Developer', // Developer with expertise in both front-end and back-end
    'Software Engineer', // Broad engineering role, including software development
    'Mobile App Developer', // Developer focused on mobile app development
    'Web Developer', // Developer focused on web development
    'Project Manager', // Management role overseeing projects
    'Entrepreneur', // Someone who starts and runs their own business
  ];
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;

    // Start looping through the text list
    Future.delayed(Duration.zero, _startTextAnimation);
  }

  void _startTextAnimation() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 2)); // Time for each text
      setState(() {
        currentIndex = (currentIndex + 1) % textList.length;
      });
      return true; // Continue looping
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          textList[currentIndex], // Text from array
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      repeatForever: true, // Loop the animation
    );
  }
}
