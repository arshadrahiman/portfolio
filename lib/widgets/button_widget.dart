import 'package:arshad_dev/theme/app_theme.dart';
import 'package:arshad_dev/theme/styles.dart';
import 'package:flutter/material.dart';

class ButtonWidgets {
  Widget primaryBtnWidget({
    required btnFunction,
    required btnName,
    required double btnHeight,
    required double btnWidth,
    double? btnRadius,
    Color? backgroundColor,
    Color? borderColor,
    TextStyle? textStyle,
    double? textSize,
    Color? textColor,
    double? elevation,
  }) {
    return SizedBox(
      width: btnWidth,
      height: btnHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(btnRadius ?? 15),
            side: BorderSide( // Add border color here
              color: borderColor ?? Colors.transparent, // Default to transparent if no border color is provided
              width: 1.0, // Set the border width
            ),
          ),
          elevation: elevation ?? 2,
        ),
        onPressed: btnFunction,
        child: Text(
          btnName,
          style: textStyle ??
              Styles.regularTextView(
                  textSize ?? 16, textColor ?? AppTheme.white),
        ),
      ),
    );
  }
}
