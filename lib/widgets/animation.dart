import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _AnimatedTextController extends GetxController {
  final List<String> textList = [
    'tech_lead'.tr,
    'senior_dev'.tr,
    'fullstack_dev'.tr,
    'software_eng'.tr,
    'mobile_dev'.tr,
    'web_dev'.tr,
    'proj_mgr'.tr,
    'entrepreneur'.tr,
  ];

  final RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _startTextAnimation();
  }

  void _startTextAnimation() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 2));
      if (isClosed) return false;
      currentIndex.value = (currentIndex.value + 1) % textList.length;
      return true;
    });
  }
}

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(_AnimatedTextController());

    return Obx(
      () => AnimatedTextKit(
        key: ValueKey(controller.currentIndex.value),
        animatedTexts: [
          TyperAnimatedText(
            controller.textList[controller.currentIndex.value],
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        repeatForever: true,
      ),
    );
  }
}
