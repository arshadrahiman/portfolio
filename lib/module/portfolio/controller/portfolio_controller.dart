import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PortfolioController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final RxBool isDrawer = false.obs;
  final RxBool isFABVisible = true.obs;
  Timer? _hideTimer;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    _hideTimer?.cancel();

    // Show the FAB when user starts scrolling
    isFABVisible.value = true;

    // Hide the FAB after 2 seconds of no scrolling
    _hideTimer = Timer(const Duration(seconds: 2), () {
      isFABVisible.value = false;
    });
  }

  /// Scrolls to a section by name
  void scrollToSection(String section) {
    isDrawer.value = false;

    double offset = 0;
    switch (section) {
      case 'home':
        offset = 0;
        break;
      case 'about':
        offset = 550;
        break;
      case 'skills':
      case 'services':
        offset = 1000;
        break;
      case 'projects':
        offset = 1450;
        break;
      case 'certifications':
        offset = 2100;
        break;
      case 'qualifications':
        offset = 2700;
        break;
      case 'experience':
        offset = 3300;
        break;
      case 'contact':
      case 'contact me':
        offset = 3700;
        break;
      case 'blog':
        offset = 0;
        break;
      default:
        break;
    }

    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    _hideTimer?.cancel();
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }
}
