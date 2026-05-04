import 'package:flutter/material.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
        'title': 'Project Integration Management PMP',
        'issuer': 'Udemy',
        'date': 'Nov 2023',
        'imageUrl': 'https://images.unsplash.com/photo-1531403009284-440f080d1e12?auto=format&fit=crop&w=400&h=300&q=80',
        'url': 'https://www.udemy.com/certificate/UC-ce6d0881-790a-42f7-9387-e1d966072959/',
      },
      {
        'title': 'iOS 16 Swift & SwiftUI - Complete iOS App Development',
        'issuer': 'Udemy',
        'date': 'Oct 2023',
        'imageUrl': 'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?auto=format&fit=crop&w=400&h=300&q=80',
        'url': 'https://www.udemy.com/certificate/UC-53715fd3-5bc6-4b95-83ef-b18bf9b24f7e/',
      },
      {
        'title': 'Flutter sqlite Database with full Project',
        'issuer': 'Udemy',
        'date': 'Jul 2023',
        'imageUrl': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=400&h=300&q=80',
        'url': 'https://www.udemy.com/certificate/UC-4e93a37-c466-4675-936a-653b05da68e/',
      },
      {
        'title': 'Figma UI/UX Design course 2022',
        'issuer': 'Figma',
        'date': 'Apr 2022',
        'imageUrl': 'https://images.unsplash.com/photo-1586717791821-3f44a563de4d?auto=format&fit=crop&w=400&h=300&q=80',
        'url': 'https://www.udemy.com/certificate/UC-6a06a9a2-3e36-4832-9ebc-22344a909cf1/',
      },
      {
        'title': 'PMI Risk Management Professional (PMI-RMP)',
        'issuer': 'Project Management Institute',
        'date': 'Apr 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1454165833767-1316b044633b?auto=format&fit=crop&w=400&h=300&q=80',
        'url': 'https://www.pmi.org/certifications/risk-management-rmp',
      },
      {
        'title': 'Python program From UST',
        'issuer': 'UST',
        'date': 'Dec 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Introduction to Cybersecurity',
        'issuer': 'Cisco Networking Academy',
        'date': 'Apr 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=400&h=300&q=80',
        'url': 'https://www.credly.com/badges/0a4a87ce-4026-4417-a136-21ee0c21ac69/public_url',
      },
      {
        'title': 'Project management short course',
        'issuer': 'eLearning College',
        'date': 'Dec 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1531403009284-440f080d1e12?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Introduction to Flutter Development- Dart',
        'issuer': 'The App Brewery',
        'date': 'Nov 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Introduction to Scrum',
        'issuer': 'BlazeMeter University',
        'date': 'Oct 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1522071823991-b99c551e581c?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Apache JMeter Pro',
        'issuer': 'BlazeMeter University',
        'date': 'Oct 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1516259762381-22954d7d3ad2?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Certification in Agile Scrum Essential',
        'issuer': 'IIBA',
        'date': 'Sep 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1522071823991-b99c551e581c?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Certified Software Tester (CSTE)',
        'issuer': 'ISTP Digital',
        'date': 'Jun 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1516259762381-22954d7d3ad2?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Css course',
        'issuer': 'Sololearn',
        'date': 'May 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1507721999472-8ed4421c4af2?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'HTML fundamental course',
        'issuer': 'Sololearn',
        'date': 'Apr 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1507721999472-8ed4421c4af2?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'SelectorsHub Certification Program',
        'issuer': 'SelectorsHub',
        'date': 'Apr 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1516259762381-22954d7d3ad2?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Understanding of SQL',
        'issuer': 'Sololearn',
        'date': 'Feb 2021',
        'imageUrl': 'https://images.unsplash.com/photo-1544383835-bda2bc66a55d?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Cybersecurity',
        'issuer': 'Edapt',
        'date': 'Apr 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'CyberSecurity Forensic Analyst (CSFA)',
        'issuer': 'Edapt',
        'date': 'Oct 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Certified Software Tester (CSTE)',
        'issuer': 'EDUONIX',
        'date': 'Oct 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1516259762381-22954d7d3ad2?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'The fundamental of digital marketing',
        'issuer': 'Google Digital Garage',
        'date': 'Apr 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Digital marketing',
        'issuer': 'Edapt',
        'date': 'Apr 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=400&h=300&q=80',
        'url': '#',
      },
      {
        'title': 'Introduction to software product management',
        'issuer': 'University of Alberta',
        'date': 'Apr 2020',
        'imageUrl': 'https://images.unsplash.com/photo-1531403009284-440f080d1e12?auto=format&fit=crop&w=400&h=300&q=80',
        'url': 'https://www.coursera.org/account/accomplishments/verify/3TCJQPQAVGZ',
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
                          child: GestureDetector(
                            onTap: () {
                              if (widget.url != '#') {
                                launchUrl(Uri.parse(widget.url));
                              }
                            },
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
                              if (widget.url != '#') {
                                launchUrl(Uri.parse(widget.url));
                              }
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
