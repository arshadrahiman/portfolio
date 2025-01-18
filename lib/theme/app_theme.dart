import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      )),
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white)),
      colorScheme: lightColorScheme.copyWith(background: Colors.white));

  static final dark = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      )),
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white)),
      colorScheme: darkColorScheme.copyWith(background: Colors.black));

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryColor,
    primaryContainer: Color(0xFF640AFF),
    secondary: Color(0xFF03DAC5),
    secondaryContainer: Color(0xFF0AE1C5),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: primaryColor,
    primaryContainer: Color(0xFF640AFF),
    secondary: Color(0xFF03DAC5),
    secondaryContainer: Color(0xFF0AE1C5),
    background: Color(0xFF242424),
    surface: Color(0xFF151515),
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFFD3D2E6),
    onSurface: Color(0xFFC9C7DB),
    brightness: Brightness.dark,
  );

  static const Color primaryColor = Color(0xff17243E);
  static const Color backgroundColor = Color(0xFFF2F6FF);
  static const Color appBackgroundColor = Color(0xFFEEEEEE);
  static const Color secondaryBackgroundColor = Color(0xFFE4DFF8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color semiBlue = Color(0xFF0A8AE0);
  static const Color cherryRed = Color(0xFFE1012D);


  //Button Colors
  static const Color primaryButtonColor = primaryColor;
  static const Color secondaryButtonColor = Color(0xFFEEF0F2);
  static const Color thirdButtonColor = Color(0xFFFCE6EA);


  //Text Colors
  static const Color primaryTextColor = Color(0xff17243E);
  static const Color secondaryTextColor = Color(0xFF7B7890);
  static const Color thirdTextColor = Color(0xFF0F0A39);
  static const Color fourthTextColor = Color(0xFF7C7890);
  static const Color fifthTextColor = Color(0xFF666666);
  static const Color sixthTextColor = Color(0xFFCBC9D9);

  //State Colors
  static const Color warningTextColor = Color(0xFFCB5A2A);
  static const Color warningBgColor = Color(0xFFFFEAE1);
  static const Color successTextColor = Color(0xFF38A160);
  static const Color successBgColor = Color(0xFFEEF7F1);
  static const Color errorTextColor = Color(0xFFE24C4C);
  static const Color errorBgColor = Color(0xFFFEECEC);
  //Border Colors
  static const Color primaryBorderColor = Color(0xFFE1012D);
  static const Color thirdBorderColor = Color(0xFFFEFEFE);
  static const Color fourthBorderColor = Color(0xFF883DDC);
  static const Color fifthBorderColor = Color(0xFFCCCCCC);

  //Util Colors
  static const Color dividerColor = Color(0xFFCB5A2A);
  static const Color borderColor = Color(0xffe8e8e8);
  static const Color secondBorderColor = Color(0xffB4A2BE);
  static const Color greyLight = Color(0xffA2A2A2);
  static const Color yellowLight = Color(0xffFFBC0B);
  static const Color lightGreen = Color(0xff48D382);
  static const Color polar = Color(0xffEDFBF4);
  static const Color indicatorGreen = Color(0xff03BF6F);
  static const Color divideLineColor = Color(0xFFEAE9F0);
  static const Color indicatorBorderColor = Color(0xFFCCCCCC);
  static const Color greyTextColor = Color(0xFF999999);
  static const Color purpleHeart = Color(0xFF883DDC);
  static const Color moonRaker = Color(0xFFE4DFF8);
  static const Color athensGray = Color(0xFFEAEEF1);

  static const MaterialColor darkGreen = MaterialColor(
    _darkGreenPrimaryValue,
    <int, Color>{
      50: Color(0xFFF5FAF7),
      100: Color(0xFFEEF7F1),
      200: Color(0xFFC6F1D6),
      300: Color(0xFF9AE5B6),
      400: Color(0xFF68D391),
      500: Color(_darkGreenPrimaryValue),
      600: Color(0xFF38A160),
      700: Color(0xFF1B984B),
      800: Color(0xFF276840),
      900: Color(0xFF225335),
    },
  );
  static const int _darkGreenPrimaryValue = 0xFFFFBC0B;

  static const MaterialColor yellow = MaterialColor(
    _yellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFFDF9F2),
      100: Color(0xFFFEF4E2),
      200: Color(0xFFFEE9BF),
      300: Color(0xFFFCDA97),
      400: Color(0xFFFACF7A),
      500: Color(_yellowPrimaryValue),
      600: Color(0xFFD6932E),
      700: Color(0xFFCA8012),
      800: Color(0xFF976417),
      900: Color(0xFF744C11),
    },
  );
  static const int _yellowPrimaryValue = 0xFFECAC4B;

  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFFEF6F6),
      100: Color(0xFFFEECEC),
      200: Color(0xFFF6DFDF),
      300: Color(0xFFFEB9B9),
      400: Color(0xFFFC8888),
      500: Color(_redPrimaryValue),
      600: Color(0xFFE24C4C),
      700: Color(0xFFC53B3B),
      800: Color(0xFF9B4646),
      900: Color(0xFF742525),
    },
  );
  static const int _redPrimaryValue = 0xFFdc3545;

  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFE0E0E0),
      300: Color(0xFFBDBDBD),
      400: Color(0xFF9E9E9E),
      500: Color(_greyPrimaryValue),
      600: Color(0xFF616161),
      700: Color(0xFF424242),
      800: Color(0xFF303030),
      900: Color(0xFF212121),
    },
  );
  static const int _greyPrimaryValue =
      0xFF757575; // You can adjust the primary value if needed
}
