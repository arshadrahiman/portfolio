import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectSectionController extends GetxController {
  static const int totalPages = 8;

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
        if (currentPage.value < totalPages - 1) {
          currentPage.value++;
        } else {
          currentPage.value = 0;
        }
        pageController.animateToPage(
          currentPage.value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void goToPreviousPage() {
    if (!pageController.hasClients) return;
    final page = pageController.page!.round();
    final target = page > 0 ? page - 1 : totalPages - 1;
    pageController.animateToPage(
      target,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  void goToNextPage() {
    if (!pageController.hasClients) return;
    final page = pageController.page!.round();
    final target = page < totalPages - 1 ? page + 1 : 0;
    pageController.animateToPage(
      target,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
