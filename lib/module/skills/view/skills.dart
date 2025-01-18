import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
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
              SkillChip('State Management (Provider, Riverpod, Bloc)'),
              SkillChip('Flutter Animations'),
              SkillChip('Flutter Testing'),
              SkillChip('Flutter Web & Desktop Support'),
              SkillChip('Responsive Design'),
              SkillChip('CI/CD (Continuous Integration/Continuous Deployment)'),
              SkillChip('Native Modules (Java/Kotlin, Swift/Objective-C)'),
              SkillChip('Performance Optimization in Flutter'),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatefulWidget {
  final String skill;

  SkillChip(this.skill);

  @override
  _SkillChipState createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _isHovered
              ? [AppTheme.grey, AppTheme.black]
              : [
                  AppTheme.grey,
                  AppTheme.black,
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: _isHovered
            ? [
                BoxShadow(
                  color: AppTheme.white,
                  spreadRadius: 4,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ]
            : [],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: _isHovered ? 1.0 : 0.9,
          child: Text(
            widget.skill,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
