import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/utils/icon_utils.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class _TechStackController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxBool scrollingDown = true.obs;
  int scrollSeconds = 10;
  bool _isAutoScrolling = false;

  void startAutoScroll() {
    if (_isAutoScrolling) return;
    _isAutoScrolling = true;
    Future.delayed(const Duration(seconds: 1), _autoScroll);
  }

  void _autoScroll() {
    if (isClosed) return;
    if (!scrollController.hasClients) return;

    double maxScroll = scrollController.position.maxScrollExtent;
    double minScroll = scrollController.position.minScrollExtent;

    final target = scrollingDown.value ? maxScroll : minScroll;

    scrollController
        .animateTo(
      target,
      duration: Duration(seconds: scrollSeconds),
      curve: Curves.linear,
    )
        .then((_) {
      if (!isClosed) {
        scrollingDown.value = !scrollingDown.value;
        startAutoScroll();
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

class TechStackAutoScrollWidget extends StatelessWidget {
  const TechStackAutoScrollWidget({
    super.key,
    required this.imageHeight,
    this.titleFontSize = 24,
    this.scrollSeconds = 15,
  });

  final double imageHeight;
  final double titleFontSize;
  final int scrollSeconds;

  @override
  Widget build(BuildContext context) {
    // Use a unique tag so multiple instances don't conflict
    final tag = 'techstack_$scrollSeconds';
    final controller = Get.put(
      _TechStackController(),
      tag: tag,
    );
    controller.scrollSeconds = scrollSeconds;

    // Start auto-scroll after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startAutoScroll();
    });

    return Column(
      crossAxisAlignment: titleFontSize != 24
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        const Text(
          "Tech Stack",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: AppTheme.primaryBorderColor,
          ),
        ),
        const Gap(30),
        SizedBox(
          height: imageHeight,
          child: ListView.builder(
            itemCount: logoUrls.length,
            controller: controller.scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: titleFontSize != 24 ? 20 : 10),
                child: SizedBox(
                  height: imageHeight,
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
