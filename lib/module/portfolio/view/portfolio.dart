import 'dart:async'; // For Timer
import 'package:arshad_dev/module/about_me/view/aboutme_view.dart';
import 'package:arshad_dev/module/contact/view/contacts.dart';
import 'package:arshad_dev/module/header/view/header_page.dart';
import 'package:arshad_dev/module/projects/view/projects.dart';
import 'package:arshad_dev/module/skills/view/skills.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';
import 'dart:async'; // For Timer
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arshad_dev/module/portfolio/controller/portfolio_controller.dart';
import 'package:arshad_dev/widgets/custom_appBar.dart';

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final PortfolioController controller = Get.put(PortfolioController());
  ScrollController _scrollController = ScrollController();
  bool _isFABVisible = true; // Track FAB visibility
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();

    // Listen for scroll events
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _hideTimer?.cancel();
    super.dispose();
  }

  // Called when scrolling happens
  void _onScroll() {
    // Cancel any previous timers when scrolling starts
    if (_hideTimer != null) {
      _hideTimer!.cancel();
    }

    // Show the FAB when user starts scrolling
    setState(() {
      _isFABVisible = true;
    });

    // Start a timer to hide the FAB after 2 seconds of no scrolling
    _hideTimer = Timer(Duration(seconds: 2), () {
      setState(() {
        _isFABVisible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    // Define a scaling factor for small screens
    double scaleFactor = screenWidth < 600 ? 0.7 : 1.0;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        onActionPressed: onAppBarActionPressed,
      ),
      extendBodyBehindAppBar: true,
      endDrawer: (1 == 1) ? customDrawer(context) : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            HeroSection(),
            AboutMeSection(),
            SkillsSection(),
            ProjectsSection(),
            ContactSection(),
            // FooterSection(),
          ],
        ),
      ),
      // Add Special Plating FAB here with responsiveness
      floatingActionButton: Visibility(
        visible: _isFABVisible, // Show/Hide the FAB based on _isFABVisible
        child: FloatingActionButton.extended(
          onPressed: () {
            print("FAB pressed"); // Debugging line to confirm FAB press
            _showSpecialPlatingDialog(context);
          },
          backgroundColor: Colors.purple, // FAB background color
          label: Text(
            "Enroll the Online Courses", // Text on the FAB
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
    );
  }

  void onAppBarActionPressed(String section) {
    double offset = 0;
    controller.isDrawer.value = false;

    // Define offsets for each section
    switch (section) {
      case 'about':
        offset = 550; // Offset for About Section
        break;
      case 'skills':
        offset = 1000; // Offset for Projects Section
      case 'projects':
        offset = 1450; // Offset for Projects Section
        break;
      case 'contact':
        offset = 2100; // Offset for Contact Section
        break;
      case 'blog':
        offset = 0; // Offset for Blog Section
        break;
      default:
        break;
    }

    // Animate to the calculated position with slower speed
    _scrollController.animateTo(
      offset,
      duration:
          Duration(milliseconds: 1000), // Increased duration to make it slower
      curve: Curves.easeInOut, // Smooth animation curve
    );
  }

  Widget buildDrawerItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
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
          // Close button at the top-right
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SizedBox(height: 30), // Space after the close button
          buildDrawerItem(context, 'About', Icons.info),
          buildDrawerItem(context, 'Skills', Icons.work),
          buildDrawerItem(context, 'Projects', Icons.work),
          buildDrawerItem(context, 'Contact', Icons.contact_mail),
          buildDrawerItem(context, 'Blog', Icons.article),
          SizedBox(height: 20), // Space at the bottom
        ],
      ),
    );
  }

  void _showSpecialPlatingDialog(BuildContext context) {
    print("Showing dialog"); // Debugging line to confirm dialog is triggered

    // Show dialog using the correct context
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          title: Text(
            "Enroll in Course",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select a Course",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                CourseDropdown(), // Course selection dropdown
                SizedBox(height: 20),
                // Use the _buildTextField method for consistent styling
                _buildTextField(
                  label: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Handle name change
                  },
                ),
                SizedBox(height: 10),
                _buildTextField(
                  label: 'Phone',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Handle phone number change
                  },
                ),
                SizedBox(height: 10),
                _buildTextField(
                  label: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Handle email change
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print("Form Submitted"); // Debugging form submission
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Submit Enrollment"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppTheme.primaryBorderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
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
        labelStyle: TextStyle(color: Colors.white), // White label text
        filled: true,
        fillColor: Colors.grey[800], // Dark background for input fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: AppTheme.moonRaker, width: 2), // Teal border on focus
        ),
        hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.6)), // Slightly faded hints
      ),
      style: TextStyle(
        color: Colors.white, // Set text color to white while typing
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

// Dropdown Button Widget for selecting the course
class CourseDropdown extends StatefulWidget {
  @override
  _CourseDropdownState createState() => _CourseDropdownState();
}

class _CourseDropdownState extends State<CourseDropdown> {
  // Initially selected course
  String? selectedCourse = 'Select Course';

  // List of courses
  final List<String> courses = [
    'Select Course',
    'Flutter Mastery',
    'Dart for Beginners',
    'Advanced Flutter Development',
    'UI/UX Design with Figma',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCourse,
      dropdownColor: Colors.black87, // Background color of the dropdown
      style: TextStyle(color: Colors.white), // Text color of dropdown items
      iconEnabledColor: Colors.white, // Icon color
      isExpanded: true, // Makes the dropdown take full width
      onChanged: (String? newValue) {
        setState(() {
          selectedCourse = newValue;
        });
      },
      items: courses.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
