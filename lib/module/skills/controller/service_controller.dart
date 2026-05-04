import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (pageController.hasClients) {
        if (currentPage.value < 3) {
          currentPage.value++;
        } else {
          currentPage.value = 0;
        }
        pageController.animateToPage(
          currentPage.value,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
