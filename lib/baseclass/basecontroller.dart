import 'dart:async';
import 'dart:math';
import 'package:arshad_dev/utils/constants.dart';
import 'package:arshad_dev/utils/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:arshad_dev/apiservice/dio_api.dart';
import 'package:arshad_dev/storage/storage_service.dart';

class BaseController extends GetxController {
  StreamSubscription? networkState;
  static var repo = Get.find<DioApi>();
  static RxBool isConnected = true.obs;
  static RxBool isSessionExpired = false.obs;
  static StorageService storageService = Get.find<StorageService>();
  static RxString languageName = "english".obs;

  static arshad_devSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.horizontal,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        backgroundColor: Colors.white60);
  }

  @override
  void onInit() async {
    try {
      // getVersion();
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent));

      // networkState = Connectivity()
      //     .onConnectivityChanged
      //     .listen((ConnectivityResult connectivityResult) {
      //   if (connectivityResult == ConnectivityResult.mobile) {
      //     isConnected.value = true;
      //   } else if (connectivityResult == ConnectivityResult.wifi) {
      //     isConnected.value = true;
      //   } else {
      //     print('No Connection');
      //     isConnected.value = false;
      //   }
      // });
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  // static Future<void> getVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   version.value = "V ${packageInfo.version}(${packageInfo.buildNumber})";
  //   await StorageService().write(Constants.appVersion,
  //       "V ${packageInfo.version}(${packageInfo.buildNumber})");
  // }



  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return isConnected.value = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return isConnected.value = true;
    } else {
      return isConnected.value = false;
    }
  }

  @override
  void onClose() {
    networkState?.cancel();
    super.onClose();
  }

  Color getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1, // Opacity
    );
  }
}
