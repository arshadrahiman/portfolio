import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PortfolioController extends GetxController {
  // Create an Rx ScrollController
  final scrollController = ScrollController().obs;
  var isDrawer = false.obs;
  // Method to scroll to a specific position
  void scrollToPosition(double offset) {
    scrollController.value.animateTo(
      offset,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.value
        .dispose(); // Dispose of the controller when the controller is destroyed
  }
}
