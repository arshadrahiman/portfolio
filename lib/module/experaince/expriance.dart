import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/widgets/scroll_reveal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _ExperienceItem {
  final String designation;
  final String company;
  final String startDate;
  final String endDate;

  const _ExperienceItem({
    required this.designation,
    required this.company,
    required this.startDate,
    required this.endDate,
  });
}

class ExperienceStepperWidget extends StatelessWidget {
  const ExperienceStepperWidget({super.key});

  static const List<_ExperienceItem> _experiences = [
    _ExperienceItem(
      designation: 'Technical Lead (Flutter)',
      company: 'Mobcoder (Tawuniya Insurance), Riyadh, SA',
      startDate: 'July 2025',
      endDate: 'Present',
    ),
    _ExperienceItem(
      designation: 'Flutter Developer & Team Lead',
      company: 'Leader IT Private Limited, Technopark, India',
      startDate: 'March 2023',
      endDate: 'July 2025',
    ),
    _ExperienceItem(
      designation: 'Flutter Developer',
      company: 'Hashcode IT Solutions, Dubai, UAE',
      startDate: 'Nov 2022',
      endDate: 'Jan 2023',
    ),
    _ExperienceItem(
      designation: 'Flutter Developer',
      company: 'Hexeam Software Solutions, Kerala, India',
      startDate: 'April 2022',
      endDate: 'Oct 2022',
    ),
    _ExperienceItem(
      designation: 'QA & Automation Engineer',
      company: 'Gritstone Technologies, Kerala, India',
      startDate: 'July 2021',
      endDate: 'March 2022',
    ),
    _ExperienceItem(
      designation: 'Software Developer',
      company: 'ISTP Digital, Kerala, India',
      startDate: 'Jan 2019',
      endDate: 'June 2021',
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
            "Experience",
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
            itemCount: _experiences.length,
            itemBuilder: (context, index) {
              final item = _experiences[index];
              final isLast = index == _experiences.length - 1;
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
  final _ExperienceItem item;
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
        // Left: Designation & Company
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.designation,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.company,
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
          item.designation,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.company,
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
