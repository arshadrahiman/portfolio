import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final name = ''.obs;
  final email = ''.obs;
  final phone = ''.obs;
  final message = ''.obs;

  void submitForm() {
    if (formKey.currentState!.validate()) {
      Get.snackbar(
        'Success',
        'Form Submitted!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.7),
        colorText: Colors.white,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      );
    }
  }
}
