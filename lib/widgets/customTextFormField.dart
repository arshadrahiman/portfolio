import 'package:arshad_dev/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../theme/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? errorText;
  bool? isMandatory = false;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final double? height;
  final int? maxLines;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? hintStyleColor;
  final Color? borderColor;
  final FocusNode? focusNode;
  final bool? isObscureText;

  CustomTextFormField(
      {Key? key,
      this.label,
      this.focusNode,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      this.errorText,
      this.onChanged,
      this.onSubmitted,
      this.height,
      this.maxLines,
      this.readOnly,
      this.inputFormatters,
      this.keyboardType,
      this.isMandatory,
      this.fillColor,
      this.hintStyleColor,
      this.isObscureText,
      this.borderColor,
      this.textInputAction = TextInputAction.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Row(
            children: [
              Text(
                label!,
                style: Styles.semiBoldTextView(14, Colors.black),
              ),
              if (isMandatory == true) ...[
                const SizedBox(
                  width: 2,
                ),
                Text(
                  "*",
                  style: Styles.boldTextView(15, Colors.red),
                )
              ]
            ],
          ),
        const SizedBox(height: 10),
        Container(
          constraints: BoxConstraints(
            minHeight: 50.0,
            maxHeight: height ?? 150.0,
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isObscureText ?? false,
            obscuringCharacter: "*",
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            maxLines: maxLines ?? 1,
            readOnly: readOnly ?? false,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            textInputAction: textInputAction,
            decoration: Styles.textFormFieldHintIconStyle(
              hint: hintText,
              hintStyle: TextStyle(
                  color: hintStyleColor ?? Color(0xFFCBC9D9), fontSize: 16),
              radius: 10.0,
              borderColor: borderColor ?? AppTheme.appBackgroundColor,
              fillColor: fillColor ?? const Color(0xFFEEEEEE),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ).copyWith(
              contentPadding: const EdgeInsets.only(left: 16.0),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              errorText!,
              style: Styles.regularTextView(10, Colors.red),
            ),
          ),
      ],
    );
  }
}
