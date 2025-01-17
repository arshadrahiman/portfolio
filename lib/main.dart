import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:arshad_dev/utils/image_utils.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_animated_text/pretty_animated_text.dart';

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
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(ImageUtil.profile),
            ),
            SizedBox(height: 20),
            OffsetText(
                text: 'Abdullah Arshadul Rahman',
                duration: const Duration(seconds: 1),
                type: AnimationType.word,
                slideType: SlideAnimationType.topBottom,
                textStyle: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            AnimatedTextWidget(),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text('Contact Me'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: StadiumBorder(),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(height: 15),
                Text(
                  'I am a passionate Flutter developer with 6+ years of experience in building mobile applications.',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                SizedBox(height: 20),
                Text(
                  'I specialize in creating beautiful, responsive, and user-friendly apps using Flutter and Dart. My goal is to make mobile experiences more intuitive and seamless.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          SizedBox(width: 40),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(ImageUtil.profile), fit: BoxFit.cover),
            ),
          ),
        ],
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
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
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
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final List<Project> projects = [
    Project(
      title: 'E-Commerce App',
      description: 'A full-featured e-commerce app built with Flutter.',
      image: 'assets/ecommerce.jpg',
    ),
    Project(
      title: 'Portfolio Website',
      description: 'My personal portfolio website created using Flutter.',
      image: 'assets/portfolio.jpg',
    ),
    Project(
      title: 'Weather App',
      description: 'A weather forecasting app using OpenWeather API.',
      image: 'assets/weather.jpg',
    ),
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
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
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
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                "https://picsum.photos/200",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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

  Project({
    required this.title,
    required this.description,
    required this.image,
  });
}

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.blue[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 20),
          Text(
            'Feel free to reach out to me for collaborations, job offers, or any exciting opportunities!',
            style: TextStyle(fontSize: 18, color: Colors.grey[700]),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: Text('Get in Touch'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: StadiumBorder(),
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
      color: Colors.blueAccent, // A slightly lighter blue for a modern look
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 'Follow Me' Text
          Text(
            'Follow Me',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),

          // Social Media Icons (with hover animation if desired)
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

          // Copyright Text
          Text(
            '© 2025 Arshadul Rahman. All Rights Reserved.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build icon buttons
  Widget _buildIconButton(String assetPath, String label) {
    return IconButton(
      icon: SvgPicture.asset(
        assetPath,
        width: 35, // Increased the icon size
        height: 35,
        color: Colors.white, // Default icon color
      ),
      onPressed: () {
        // You can add your own actions here for each icon (e.g., opening a URL)
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
