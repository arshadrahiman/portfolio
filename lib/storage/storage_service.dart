import 'dart:ui';
import 'package:arshad_dev/utils/constants.dart';
import 'package:arshad_dev/utils/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class StorageService {
  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  Future<void> write(String key, dynamic value) async {
    await GetStorage().write(key, value);
  }

  Future<dynamic> read(String key) async {
    String? data = GetStorage().read(key);
    return data;
  }

  String getLanguageCode() {
    return GetStorage().read(Constants.langCode) ?? 'en';
  }

  Locale getLocale() {
    String? locale = GetStorage().read(Constants.appLanguage);
    if (locale != null && locale.isNotEmpty) {
      if (locale == Constants.arabic) {
        return const Locale('ar', 'SA');
      } else if (locale == Constants.english) {
        return const Locale('en', 'US');
      }
    }
    return Get.deviceLocale ?? const Locale('en', 'US');
  }

  bool getIsLogin() {
    return GetStorage().read(Constants.isLogin) ?? false;
  }

  String getSessionToken() {
    return GetStorage().read(Constants.sessionToken) ?? "";
  }

  String getBasicAuthSession() {
    return GetStorage().read(Constants.basicAuth) ?? "";
  }
  String getFcmToken() {
    return GetStorage().read(Constants.firebaseToken) ?? "";
  }
  String getUserImage() {
    return GetStorage().read(Constants.profilePicture) ?? "";
  }

  String getUserEmail() {
    return GetStorage().read(Constants.email) ?? "";
  }

  String getUserName() {
    return GetStorage().read(Constants.userName) ?? "";
  }

  int getUserId() {
    return GetStorage().read(Constants.userId);
  }

  int getEntityId() {
    return GetStorage().read(Constants.entitiesId);
  }

  Map<String, String> apiHeaders() {
    final headerMap = <String, String>{};
    headerMap.putIfAbsent(
        "App-Token", () => "VmQCMb7UoPc1U8qEq0S2ZgcyxNAg1oQZh2pNdmI2");
    headerMap.putIfAbsent("Session-Token", () => getSessionToken());
    headerMap.putIfAbsent("Accept-Language", () => getLanguageCode() ?? "en");
    return headerMap;
  }

  Future<bool> clearLoginData() async {
    try {
      await GetStorage().remove(Constants.basicAuth);
      await GetStorage().remove(Constants.sessionToken);
      await GetStorage().remove(Constants.userId);
      await GetStorage().remove(Constants.userName);
      await GetStorage().remove(Constants.isLogin);
      await GetStorage().remove(Constants.entitiesId);
      Get.offAllNamed(Routes.splash);
    } catch (e) {
      return false;
    }
    return true;
  }
}
