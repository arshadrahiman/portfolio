import 'package:arshad_dev/baseclass/basebinding.dart';
import 'package:arshad_dev/locale/locale_service.dart';
import 'package:arshad_dev/storage/storage_service.dart';
import 'package:arshad_dev/theme/theme_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:arshad_dev/module/portfolio/view/portfolio.dart';
import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialConfig();
  // await initFirebase();
  // await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      locale: LocaleService.getAppLocale(),
      initialBinding: BaseBinding(Constants.initialRouting),
      fallbackLocale: LocaleService.fallbackLocale,
      translations: LocaleService(),
      // initialRoute: Routes.splash,
      // builder: EasyLoading.init(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      theme: AppTheme.light,
      darkTheme: AppTheme.light,
      themeMode: ThemeMode.light,

      getPages: [],

      home: PortfolioPage(),
    );
  }
}

Future<void> initialConfig() async {
  await Get.putAsync(() => StorageService().init());
  Get.put<LocaleService>(LocaleService());
  Get.put<ThemeService>(ThemeService());
}

// initFirebase() async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
//   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

//   final firebaseMessaging = FCM();
//   firebaseMessaging.setNotifications();
//   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
// }
