import 'package:arshad_dev/module/about_me/view/aboutme_view.dart';
import 'package:arshad_dev/module/contact/view/contacts.dart';
import 'package:arshad_dev/module/footer/view/footer.dart';
import 'package:arshad_dev/module/header/view/header_page.dart';
import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:arshad_dev/module/projects/view/projects.dart';
import 'package:arshad_dev/module/skills/view/skills.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PortfolioPage extends StatelessWidget {
  // Use GetX to bind the ScrollController
  final PortfolioController scrollControllerX = Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onActionPressed: _onAppBarActionPressed),
      extendBodyBehindAppBar: true,
      body: Obx(
        () {
          return SingleChildScrollView(
            controller: scrollControllerX
                .scrollController.value, // Use the controller from GetX
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
          );
        },
      ),
    );
  }

  // Method to scroll to the respective section using GetX controller
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

    // Use the GetX controller to animate the scroll
    scrollControllerX.scrollToPosition(offset);
  }
}
