import 'package:arshad_dev/module/about_me/view/aboutme_view.dart';
import 'package:arshad_dev/module/contact/view/contacts.dart';
import 'package:arshad_dev/module/footer/view/footer.dart';
import 'package:arshad_dev/module/header/view/header_page.dart';
import 'package:arshad_dev/module/projects/view/projects.dart';
import 'package:arshad_dev/module/skills/view/skills.dart';
import 'package:arshad_dev/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';

class PortfolioPage extends StatelessWidget {
  final PortfolioController controller = Get.put(PortfolioController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onActionPressed: onAppBarActionPressed,
      ),
      extendBodyBehindAppBar: true,
      endDrawer: (1 == 1) ? customDrawer(context) : null,
      body: Obx(() {
        return SingleChildScrollView(
          controller: controller.scrollController.value,
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
      }),
    );
  }

  void onAppBarActionPressed(String section) {
    double offset = 0;
    controller.isDrawer.value = false;
    switch (section) {
      case 'about':
        offset = 500;
        break;
      case 'projects':
        offset = 1100;
        break;
      case 'contact':
        offset = 1600;
        break;
      case 'blog':
        offset = 0;
        break;
      default:
        break;
    }

    controller.scrollToPosition(offset);
  }

  Widget buildDrawerItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        onAppBarActionPressed(title.toLowerCase());
        Navigator.pop(context); // Close the drawer
      },
    );
  }

  Widget customDrawer(context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                // Close the drawer when the close icon is pressed
                Navigator.of(context).pop();
              },
            ),
          ),
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Hi, I\'m Arshadul Rahman.',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
          buildDrawerItem(context, 'About', Icons.info),
          buildDrawerItem(context, 'Projects', Icons.work),
          buildDrawerItem(context, 'Contact', Icons.contact_mail),
          buildDrawerItem(context, 'Blog', Icons.article),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(ImageUtil.profile),
            ),
          ),
        ],
      ),
    );
  }
}
