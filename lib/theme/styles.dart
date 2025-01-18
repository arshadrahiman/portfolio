import 'package:flutter/material.dart';
import 'app_theme.dart';

class Styles {
  static TextStyle regularTextView(double fontSize, Color color) => TextStyle(
      color: color,
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontWeight: FontWeight.w400);

  static TextStyle mediumTextView(double fontSize, Color color) => TextStyle(
      color: color,
      fontFamily: 'Roboto-Medium',
      fontSize: fontSize,
      height: 1.2,
      fontWeight: FontWeight.w500);

  static TextStyle semiBoldTextView(double fontSize, Color color) => TextStyle(
      color: color,
      fontFamily: 'Roboto-Bold',
      fontSize: fontSize,
      fontWeight: FontWeight.w600);

  static TextStyle boldTextView(double fontSize, Color color) => TextStyle(
      color: color,
      fontFamily: 'Roboto-Bold',
      fontSize: fontSize,
      fontWeight: FontWeight.w700);

  static TextStyle extraBoldTextView(double fontSize, Color color) => TextStyle(
      color: color,
      fontFamily: 'Roboto-Bold',
      fontSize: fontSize,
      fontWeight: FontWeight.w900);

  static TextStyle linkTextView(double fontSize, Color color) => TextStyle(
      color: color,
      fontFamily: 'Roboto',
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: AppTheme.primaryColor);

  static TextStyle italicTextView(double fontSize, Color color) => TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic,
      );

  static ButtonStyle primaryButton(double radius) => ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: AppTheme.primaryColor,
        elevation: 0,
        minimumSize: const Size(double.infinity, 50.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      );

  static ButtonStyle regularButtonStyle(
          double radius, double elevation, Color color) =>
      ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color,
        elevation: elevation,
        minimumSize: const Size(double.infinity, 50.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      );

  static InputDecoration outlinedInputBorderStyle(
          double radius, Color borderColor) =>
      InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          errorMaxLines: 3,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: borderColor,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: const BorderSide(
                color: Colors.red,
              )));

  static InputDecoration outlinedInputBorderWithHintStyle(
          String hint, double radius, Color borderColor) =>
      InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          errorMaxLines: 3,
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: BorderSide(
                color: borderColor,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: const BorderSide(
                color: Colors.red,
              )));

  static InputDecoration textFormFieldHintIconStyle({
    required String hint,
    TextStyle? hintStyle,
    required double radius,
    required Color borderColor,
    Color fillColor = Colors.transparent,
    Widget? prefixIcon,
    String? errorText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(2),
      hintText: hint,
      hintStyle: const TextStyle(
          color: Color(0xffC8C8C8),
          fontFamily: "Roboto-Regular",
          fontStyle: FontStyle.normal),
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: BorderSide(
          color: borderColor,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: const BorderSide(
          color: Color(0xFF1CB281),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        borderSide: const BorderSide(
          color: Color(0xFF1CB281),
          width: 2.0,
        ),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText,
    );
  }
}
