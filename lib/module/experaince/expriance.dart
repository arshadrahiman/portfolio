import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
import 'dart:ui'; // Import for the BackdropFilter

class ExperienceStepperWidget extends StatelessWidget {
  final _stepperData = List.generate(
    5,
    (index) => StepperItemData(
      id: '$index',
      content: ({
        'designation': 'Flutter Developer',
        'company': 'XYZ Corp',
        'work_start_date': 'Jan 2020',
        'work_end_date': 'Present',
        'responsibilities': [
          'Developing mobile apps using Flutter',
          'Collaborating with cross-functional teams',
          'Writing clean, maintainable code',
        ],
      }),
      avatar: 'https://avatars.githubusercontent.com/u/70679949?v=4',
    ),
  ).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      height: 1250, // Set a static height for your widget (remove scrolling)
      color: Colors.black,
      padding: const EdgeInsets.all(10.0), // Reduce overall padding
      child: Column(
        children: [
          // Header Text
          const SizedBox(height: 20),
          Text(
            "Experience",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
              height: 5), // Add some space between the header and the stepper

          // Stepper List View
          Expanded(
            child: StepperListView(
              showStepperInLast: true,
              stepperData: _stepperData,
              stepAvatar: (_, data) {
                return PreferredSize(
                  preferredSize:
                      const Size.fromRadius(16), // Smaller avatar size
                  child: CircleAvatar(
                    backgroundColor: Colors.black, // Background color of circle
                    child: CircleAvatar(
                      radius: 12, // Smaller icon's circular background
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 10, // White circle around the icon
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 8, // Icon itself inside a white circle
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.work, // Example icon for work
                            color: Colors.red, // Icon color as red
                            size: 16, // Smaller icon size
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              stepWidget: (_, data) {
                final stepData = data as StepperItemData;
                return PreferredSize(
                  preferredSize:
                      const Size.fromWidth(25), // Adjust size of step label
                  child: Text(
                    stepData.content['company'] ?? '', // Show company name here
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13, // Smaller font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              stepContentWidget: (_, data) {
                final stepData = data as StepperItemData;
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10), // Reduced margin
                      padding: const EdgeInsets.all(8), // Reduced padding
                      decoration: BoxDecoration(
                        color:
                            Colors.white.withOpacity(0.2), // Transparent effect
                        borderRadius:
                            BorderRadius.circular(12), // Smaller radius
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.all(4), // Reduced padding
                        visualDensity:
                            const VisualDensity(vertical: -2, horizontal: -2),
                        title: Text(
                          stepData.content['designation'] ?? '',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // White for small text
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6), // Reduced spacing
                            _buildInfoRow(Icons.date_range,
                                stepData.content['work_start_date'] ?? ''),
                            const SizedBox(height: 6), // Reduced spacing
                            _buildInfoRow(Icons.date_range,
                                stepData.content['work_end_date'] ?? ''),
                            const SizedBox(height: 12), // Reduced spacing
                            Text(
                              'Responsibilities',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.red, // Red for headings
                              ),
                            ),
                            const SizedBox(height: 4), // Reduced spacing
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 6), // Smaller padding
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (stepData.content['responsibilities']
                                        as List<String>)
                                    .map((responsibility) =>
                                        _buildResponsibilityRow(responsibility))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Smaller radius
                          side: BorderSide(color: Colors.grey, width: 0.8),
                        ),
                      ),
                    ),
                  ),
                );
              },
              stepperThemeData: StepperThemeData(
                lineColor: Colors.red, // Line color red
                lineWidth: 4, // Slightly thinner line
              ),
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for building information rows (Designation, Company, etc.)
  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.black, // Circular background for icons
          radius: 12, // Smaller avatar size
          child: CircleAvatar(
            radius: 10, // Inner circle for the icon
            backgroundColor: Colors.black,
            child: CircleAvatar(
              radius: 8, // White background for the icon
              backgroundColor: Colors.white,
              child: Icon(
                icon, // The icon itself
                color: Colors.red, // Icon color as red
                size: 14, // Smaller icon size
              ),
            ),
          ),
        ),
        const SizedBox(width: 6), // Reduced spacing
        Expanded(
            child: Text(
          text,
          style:
              TextStyle(fontSize: 12, color: Colors.white), // Small white text
        )),
      ],
    );
  }

  // Helper method for displaying each responsibility as a list item
  Widget _buildResponsibilityRow(String responsibility) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.red, // Icon color for responsibility (red)
          size: 14, // Smaller icon size
        ),
        const SizedBox(width: 6), // Reduced spacing
        Expanded(
            child: Text(
          responsibility,
          style:
              TextStyle(fontSize: 12, color: Colors.white), // Small white text
        )),
      ],
    );
  }
}
