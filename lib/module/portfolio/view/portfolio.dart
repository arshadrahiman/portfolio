import 'package:arshad_dev/module/about_me/view/aboutme_view.dart';
import 'package:arshad_dev/module/contact/view/contacts.dart';
import 'package:arshad_dev/module/footer/view/footer.dart';
import 'package:arshad_dev/module/header/view/header_page.dart';
import 'package:arshad_dev/module/projects/view/projects.dart';
import 'package:arshad_dev/module/skills/view/skills.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onActionPressed: _onAppBarActionPressed),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: _scrollController, // Attach the controller here
        child: Column(
          children: [
            HeroSection(),
            AboutMeSection(),
            SkillsSection(),
            ProjectsSection(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  // Method to scroll to the respective section
  void _onAppBarActionPressed(String section) {
    double offset = 0;

    switch (section) {
      case 'about':
        offset = 500; // Approximate scroll position for About Me section
        break;
      case 'projects':
        offset = 1100; // Approximate scroll position for Projects section
        break;
      case 'contact':
        offset = 1600; // Approximate scroll position for Contact section
        break;
      case 'blog':
        offset = 0; // Approximate scroll position for Blog section (if added)
        break;
      default:
        break;
    }

    // Animate to the selected section
    _scrollController.animateTo(
      offset,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
