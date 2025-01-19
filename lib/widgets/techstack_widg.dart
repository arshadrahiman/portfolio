import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/utils/icon_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TechStackAutoScrollWidget extends StatefulWidget {
  const TechStackAutoScrollWidget({
    super.key,
    required this.imageHeight,
    this.titleFontSize = 24,
    this.scrollSeconds = 10,
  });

  final double imageHeight;
  final double titleFontSize;
  final int scrollSeconds;

  @override
  State<TechStackAutoScrollWidget> createState() =>
      _TechStackAutoScrollWidgetState();
}

class _TechStackAutoScrollWidgetState extends State<TechStackAutoScrollWidget> {
  final ScrollController _scrollController = ScrollController();
  bool _scrollingDown = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 1), _autoScroll);
  }

  void _autoScroll() {
    if (_scrollController.hasClients) {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double minScroll = _scrollController.position.minScrollExtent;

      if (_scrollingDown) {
        _scrollController
            .animateTo(
          maxScroll,
          duration: Duration(seconds: widget.scrollSeconds),
          curve: Curves.linear,
        )
            .then((value) {
          if (mounted) {
            setState(() {
              _scrollingDown = false;
            });
            _startAutoScroll();
          }
        });
      } else {
        _scrollController
            .animateTo(
          minScroll,
          duration: Duration(seconds: widget.scrollSeconds),
          curve: Curves.linear,
        )
            .then((value) {
          if (mounted) {
            setState(() {
              _scrollingDown = true;
            });
            _startAutoScroll();
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.titleFontSize != 24
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Tech Stack",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppTheme.primaryBorderColor,
          ),
        ),
        const Gap(30),
        SizedBox(
          height: widget.imageHeight,
          child: ListView.builder(
            itemCount: logoUrls.length,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.titleFontSize != 24 ? 20 : 10),
                child: SizedBox(
                  height: widget.imageHeight,
                  child: Image.asset(
                    "assets/icons/${logoUrls[index]}.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
