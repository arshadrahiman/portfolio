import 'package:flutter/material.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'dart:ui';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          _buildHeader(isMobile),
          const Gap(40),
          _buildCertificationsGrid(isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.primaryBorderColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.primaryBorderColor.withValues(alpha: 0.2),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.verified,
                color: AppTheme.primaryBorderColor,
                size: 16,
              ),
              SizedBox(width: 8),
              Text(
                'ACHIEVEMENTS',
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
          'Certifications',
          style: TextStyle(
            fontSize: isMobile ? 32 : 48,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.5,
            height: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _buildCertificationsGrid(bool isMobile) {
    final certifications = [
      {
        'title': 'Google UX Design Professional Certificate',
        'issuer': 'Google / Coursera',
        'date': 'Aug 2023',
        'imageUrl': 'https://picsum.photos/400/300?1',
        'url': '#',
      },
      {
        'title': 'Flutter & Dart - The Complete Guide',
        'issuer': 'Udemy',
        'date': 'Jan 2024',
        'imageUrl': 'https://picsum.photos/400/300?2',
        'url': '#',
      },
      {
        'title': 'Firebase Cloud Firestore',
        'issuer': 'Google Developers',
        'date': 'Nov 2023',
        'imageUrl': 'https://picsum.photos/400/300?3',
        'url': '#',
      },
      {
        'title': 'Clean Architecture & SOLID Principles',
        'issuer': 'Pluralsight',
        'date': 'Mar 2024',
        'imageUrl': 'https://picsum.photos/400/300?4',
        'url': '#',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 1 : (Get.width < 1200 ? 2 : 3),
        childAspectRatio: isMobile ? 1.1 : 1.2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
      ),
      itemCount: certifications.length,
      itemBuilder: (context, index) {
        final cert = certifications[index];
        return CertificationCard(
          title: cert['title']!,
          issuer: cert['issuer']!,
          date: cert['date']!,
          imageUrl: cert['imageUrl']!,
          url: cert['url']!,
        );
      },
    );
  }
}

class CertificationCard extends StatefulWidget {
  final String title;
  final String issuer;
  final String date;
  final String imageUrl;
  final String url;

  const CertificationCard({
    super.key,
    required this.title,
    required this.issuer,
    required this.date,
    required this.imageUrl,
    required this.url,
  });

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Section
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      AnimatedScale(
                        scale: _isHovered ? 1.05 : 1.0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOutQuart,
                        child: Image.network(
                          widget.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              const Color(0xFF121212).withValues(alpha: 0.8),
                            ],
                            stops: const [0.5, 1.0],
                          ),
                        ),
                      ),
                      if (_isHovered)
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.open_in_new,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              // Content Section
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.issuer,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.primaryBorderColor
                                  .withValues(alpha: 0.9),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.date,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withValues(alpha: 0.5),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              // Launch URL logic
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: AppTheme.primaryBorderColor,
                            ),
                            label: Text(
                              'View',
                              style: TextStyle(
                                color: AppTheme.primaryBorderColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
