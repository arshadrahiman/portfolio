import 'package:arshad_dev/module/projects/controller/project_section_controller.dart';
import 'package:arshad_dev/widgets/scroll_reveal.dart';
import 'package:flutter/material.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'dart:ui';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String githubUrl;
  final String? figmaUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
    this.figmaUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    double descriptionFontSize = isMobile ? 14 : 16;
    double titleFontSize = isMobile ? 24 : 32;

    return ScrollReveal(
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered && !isMobile ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuart,
          child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFF121212),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primaryBorderColor.withValues(alpha: 0.5)
                  : Colors.white.withValues(alpha: 0.05),
              width: 1,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppTheme.primaryBorderColor.withValues(alpha: 0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                )
              else
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: isMobile
                ? _buildMobileLayout(titleFontSize, descriptionFontSize)
                : _buildDesktopLayout(titleFontSize, descriptionFontSize),
          ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(double titleFontSize, double descriptionFontSize) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Image Section
        Expanded(
          flex: 5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutQuart,
                child: widget.imageUrl.startsWith('assets/')
                    ? Image.asset(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
              // Gradient fade to blend image with content
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Color(0xFF121212),
                    ],
                    stops: [0.5, 1.0],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Content Section
        Expanded(
          flex: 4,
          child: Container(
            color: const Color(0xFF121212),
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryBorderColor.withValues(alpha: 0.2),
                        AppTheme.primaryBorderColor.withValues(alpha: 0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppTheme.primaryBorderColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star,
                          size: 14, color: AppTheme.primaryBorderColor),
                      const SizedBox(width: 6),
                      const Text(
                        "FEATURED",
                        style: TextStyle(
                          color: AppTheme.primaryBorderColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: descriptionFontSize,
                    color: Colors.white.withValues(alpha: 0.7),
                    height: 1.6,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    _ProjectButton(
                      icon: Icons.code,
                      label: 'GitHub',
                      onPressed: () => launchURL(widget.githubUrl),
                    ),
                    if (widget.figmaUrl != null) ...[
                      const SizedBox(width: 16),
                      _ProjectButton(
                        icon: Icons.design_services,
                        label: 'Figma',
                        onPressed: () => launchURL(widget.figmaUrl!),
                        isSecondary: true,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(double titleFontSize, double descriptionFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Image Section
        Expanded(
          flex: 4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOutQuart,
                child: widget.imageUrl.startsWith('assets/')
                    ? Image.asset(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xFF121212),
                    ],
                    stops: [0.4, 1.0],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Content Section
        Expanded(
          flex: 5,
          child: Container(
            color: const Color(0xFF121212),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBorderColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.primaryBorderColor.withValues(alpha: 0.2),
                    ),
                  ),
                  child: const Text(
                    "FEATURED",
                    style: TextStyle(
                      color: AppTheme.primaryBorderColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Text(
                    widget.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.white.withValues(alpha: 0.7),
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _ProjectButton(
                        icon: Icons.code,
                        label: 'GitHub',
                        onPressed: () => launchURL(widget.githubUrl),
                      ),
                    ),
                    if (widget.figmaUrl != null) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ProjectButton(
                          icon: Icons.design_services,
                          label: 'Figma',
                          onPressed: () => launchURL(widget.figmaUrl!),
                          isSecondary: true,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Helper function to launch URLs
  void launchURL(String url) {
    // Implementation uses url_launcher
  }
}

class _ProjectButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isSecondary;

  const _ProjectButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  State<_ProjectButton> createState() => _ProjectButtonState();
}

class _ProjectButtonState extends State<_ProjectButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.isSecondary
                    ? Colors.white.withValues(alpha: 0.1)
                    : AppTheme.primaryBorderColor)
                : (widget.isSecondary
                    ? Colors.transparent
                    : AppTheme.primaryBorderColor.withValues(alpha: 0.8)),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: widget.isSecondary
                  ? (_isHovered
                      ? Colors.white.withValues(alpha: 0.5)
                      : Colors.grey.withValues(alpha: 0.3))
                  : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _NavIconButton({required this.icon, required this.onPressed});

  @override
  State<_NavIconButton> createState() => _NavIconButtonState();
}

class _NavIconButtonState extends State<_NavIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.white.withValues(alpha: 0.15)
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(widget.icon, size: 24, color: Colors.white),
        ),
      ),
    );
  }
}

class NavigationButtons extends StatelessWidget {
  final ProjectSectionController controller;

  const NavigationButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavIconButton(
                  icon: CupertinoIcons.arrow_left,
                  onPressed: controller.goToPreviousPage,
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: Colors.white.withValues(alpha: 0.2),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                ),
                _NavIconButton(
                  icon: CupertinoIcons.arrow_right,
                  onPressed: controller.goToNextPage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectDesktopWidget extends GetView<ProjectSectionController> {
  const ProjectDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      color: const Color(0xFF0D0D0D),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryBorderColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppTheme.primaryBorderColor.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.code,
                      color: AppTheme.primaryBorderColor,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'PORTFOLIO',
                      style: TextStyle(
                        color: AppTheme.primaryBorderColor,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Featured Projects',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                  height: 1.1,
                ),
              ),
            ],
          ),
          const Gap(40),
          SizedBox(
            height: isMobile ? height * 0.7 : height * 0.6,
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                PageView(
                  controller: controller.pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: controller.onPageChanged,
                  children: const [
                    ProjectCard(
                      title: "FlashChat",
                      description:
                          "A real-time messaging app built with Firebase and GetX for state management. Features premium UI, push notifications, and instant message delivery.",
                      imageUrl: "assets/icons/flashchat.png",
                      githubUrl: "https://github.com/arshadrahiman",
                    ),
                    ProjectCard(
                      title: "Monify",
                      description:
                          "Comprehensive personal finance manager. Built with GetX and local storage, featuring expense tracking, budget planning, and detailed analytics.",
                      imageUrl: "assets/icons/monify.png",
                      githubUrl: "https://github.com/arshadrahiman",
                    ),
                    ProjectCard(
                      title: "RoadRadar",
                      description:
                          "A smart navigation and road safety application that helps users avoid traffic incidents and report hazards in real-time.",
                      imageUrl: "assets/icons/roadradar.png",
                      githubUrl: "https://github.com/arshadrahiman",
                    ),
                    ProjectCard(
                      title: "Weather App",
                      description:
                          "A weather app using a weather API, location services, and connectivity management to show current weather conditions.",
                      imageUrl: "https://picsum.photos/800/604",
                      githubUrl: "https://github.com/yourusername/WeatherApp",
                    ),
                    ProjectCard(
                      title: "Personal Portfolio",
                      description:
                          "My personal portfolio website showcasing my skills, projects, and experience. Built using HTML, CSS, and JavaScript.",
                      imageUrl: "https://picsum.photos/800/605",
                      githubUrl: "https://github.com/yourusername/Portfolio",
                      figmaUrl: "https://www.figma.com/file/portfolio-link",
                    ),
                    ProjectCard(
                      title: "Portfolio and Blog",
                      description:
                          "My portfolio and blog site where I share my thoughts and projects. Built using HTML, CSS, and JavaScript.",
                      imageUrl: "https://picsum.photos/800/606",
                      githubUrl:
                          "https://github.com/yourusername/PortfolioBlog",
                    ),
                    ProjectCard(
                      title: "JS Calculator",
                      description:
                          "A simple calculator built using JavaScript. Includes basic arithmetic operations and a user-friendly UI.",
                      imageUrl: "https://picsum.photos/800/607",
                      githubUrl: "https://github.com/yourusername/JsCalculator",
                    ),
                  ],
                ),
                NavigationButtons(controller: controller),
              ],
            ),
          ),
          const Gap(30),
          Center(
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: ProjectSectionController.totalPages,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
                activeDotColor: AppTheme.primaryBorderColor,
                dotColor: Colors.white24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
