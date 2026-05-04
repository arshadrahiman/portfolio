import 'package:arshad_dev/module/about_me/view/aboutme_view.dart';
import 'package:arshad_dev/module/contact/view/contacts.dart';
import 'package:arshad_dev/module/experaince/expriance.dart';
import 'package:arshad_dev/module/qualification/view/qualification_section.dart';
import 'package:arshad_dev/module/header/view/header_page.dart';
import 'package:arshad_dev/module/projects/view/project_section.dart';
import 'package:arshad_dev/module/certifications/view/certifications_section.dart';
import 'package:arshad_dev/module/skills/view/service.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';

class PortfolioPage extends GetView<PortfolioController> {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    // Define a scaling factor for small screens
    double scaleFactor = screenWidth < 600 ? 0.7 : 1.0;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        onActionPressed: (section) =>
            controller.scrollToSection(section.toLowerCase()),
      ),
      extendBodyBehindAppBar: true,
      endDrawer: _customDrawer(context),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            HeroSection(),
            AboutMeSection(),
            ServiceDesktopWidget(),
            ProjectDesktopWidget(),
            const CertificationsSection(),
            const QualificationStepperWidget(),
            ExperienceStepperWidget(),
            ContactSection(),
          ],
        ),
      ),
      // Reactive FAB visibility using Obx
      floatingActionButton: Obx(
        () => Visibility(
          visible: controller.isFABVisible.value,
          child: FloatingActionButton.extended(
            onPressed: () => _showSpecialPlatingDialog(context),
            backgroundColor: Colors.purple,
            label: Text(
              "Enroll the Online Courses",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16 * scaleFactor,
              ),
            ),
            icon: Icon(
              Icons.school,
              color: Colors.white,
              size: 24 * scaleFactor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        controller.scrollToSection(title.toLowerCase());
        Navigator.pop(context); // Close the drawer
      },
    );
  }

  Widget _customDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Close button at the top-right
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(height: 30),
          _buildDrawerItem(context, 'Home', Icons.info),
          _buildDrawerItem(context, 'About', Icons.info),
          _buildDrawerItem(context, 'Services', Icons.work),
          _buildDrawerItem(context, 'Projects', Icons.work),
          _buildDrawerItem(context, 'Certifications', Icons.verified),
          _buildDrawerItem(context, 'Qualifications', Icons.school),
          _buildDrawerItem(context, 'Experience', Icons.work),
          _buildDrawerItem(context, 'Contact', Icons.contact_mail),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showSpecialPlatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          title: const Text(
            "Enroll in Course",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Select a Course",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                CourseDropdown(),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  label: 'Phone',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                _buildTextField(
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppTheme.primaryBorderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Submit Enrollment"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper method to build text fields with consistent styling
  Widget _buildTextField({
    required String label,
    int maxLines = 1,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
  }) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.8),
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: Colors.grey[850],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppTheme.moonRaker,
            width: 2.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.5,
          ),
        ),
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
          fontSize: 16,
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

// Dropdown Button Widget for selecting the course — uses GetX reactive state
class CourseDropdown extends StatelessWidget {
  CourseDropdown({super.key});

  final RxString selectedCourse = 'Select Course'.obs;

  final List<String> courses = const [
    'Select Course',
    'Flutter Mastery',
    'Dart for Beginners',
    'Advanced Flutter Development',
    'UI/UX Design with Figma',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        value: selectedCourse.value,
        dropdownColor: Colors.black87,
        style: const TextStyle(color: Colors.white),
        iconEnabledColor: Colors.white,
        isExpanded: true,
        onChanged: (String? newValue) {
          if (newValue != null) {
            selectedCourse.value = newValue;
          }
        },
        items: courses.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
