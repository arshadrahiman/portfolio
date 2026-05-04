import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/widgets/scroll_reveal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _QualificationItem {
  final String degree;
  final String institution;
  final String startDate;
  final String endDate;

  const _QualificationItem({
    required this.degree,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });
}

class QualificationStepperWidget extends StatelessWidget {
  const QualificationStepperWidget({super.key});

  static const List<_QualificationItem> _qualifications = [
    _QualificationItem(
      degree: 'MBA in Project Leadership and Management',
      institution: 'Suresh Gyan Vihar University, Rajasthan',
      startDate: '2023',
      endDate: '2025',
    ),
    _QualificationItem(
      degree: 'BCA in Computer Application',
      institution: 'Bharathiar University, Tamil Nadu',
      startDate: '2018',
      endDate: '2021',
    ),
    _QualificationItem(
      degree: 'High School (CBSE)',
      institution: 'Sabari Central School, Cherplasheri',
      startDate: '2001',
      endDate: '2017',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      color: Colors.black,
      child: Column(
        children: [
          Text(
            "Qualification",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 50),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _qualifications.length,
            itemBuilder: (context, index) {
              final item = _qualifications[index];
              final isLast = index == _qualifications.length - 1;
              final isCurrent = item.endDate == 'Present';

              return _TimelineRow(
                item: item,
                isLast: isLast,
                isCurrent: isCurrent,
                isMobile: isMobile,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final _QualificationItem item;
  final bool isLast;
  final bool isCurrent;
  final bool isMobile;
  final int index;

  const _TimelineRow({
    required this.item,
    required this.isLast,
    required this.isCurrent,
    required this.isMobile,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isHovered = false.obs;

    return ScrollReveal(
      delay: Duration(milliseconds: index * 200),
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(
              isHovered.value ? 8 : 0,
              0,
              0,
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Timeline indicator column
                  SizedBox(
                    width: 60,
                    child: Column(
                      children: [
                        // Dot
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: isHovered.value ? 20 : 16,
                          height: isHovered.value ? 20 : 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrent
                                ? AppTheme.primaryBorderColor
                                : isHovered.value
                                    ? AppTheme.primaryBorderColor
                                    : Colors.white,
                            border: Border.all(
                              color: isCurrent
                                  ? AppTheme.primaryBorderColor
                                  : Colors.grey,
                              width: 2,
                            ),
                            boxShadow: isCurrent || isHovered.value
                                ? [
                                    BoxShadow(
                                      color: AppTheme.primaryBorderColor
                                          .withValues(alpha: 0.5),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ]
                                : [],
                          ),
                        ),
                        // Vertical line
                        if (!isLast)
                          Expanded(
                            child: Container(
                              width: 2,
                              color: Colors.grey.withValues(alpha: 0.3),
                            ),
                          ),
                      ],
                    ),
                  ),
  
                  // Content card
                  Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: isHovered.value
                            ? Colors.white.withValues(alpha: 0.08)
                            : Colors.white.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isHovered.value
                              ? AppTheme.primaryBorderColor.withValues(alpha: 0.4)
                              : Colors.grey.withValues(alpha: 0.15),
                          width: 1,
                        ),
                      ),
                      child:
                          isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Degree & Institution
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.degree,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.institution,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        // Right: Date range
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isCurrent
                ? AppTheme.primaryBorderColor.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isCurrent
                  ? AppTheme.primaryBorderColor.withValues(alpha: 0.4)
                  : Colors.grey.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            '${item.startDate} — ${item.endDate}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isCurrent ? AppTheme.primaryBorderColor : Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.degree,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.institution,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey[400],
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isCurrent
                ? AppTheme.primaryBorderColor.withValues(alpha: 0.15)
                : Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isCurrent
                  ? AppTheme.primaryBorderColor.withValues(alpha: 0.4)
                  : Colors.grey.withValues(alpha: 0.2),
            ),
          ),
          child: Text(
            '${item.startDate} — ${item.endDate}',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isCurrent ? AppTheme.primaryBorderColor : Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }
}
