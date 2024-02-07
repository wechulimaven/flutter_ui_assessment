import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class Styles {
  static TextStyle loginTextStyle = TextStyle(
      color: Palette.primaryTextColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w700);

  static TextStyle snackTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
  );

  static TextStyle normalTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontSize: 16.sp,
  );

  static TextStyle inputHintTextStyle = TextStyle(
    color: Palette.inputTitleColor,
    fontSize: 14.sp,
  );

  static TextStyle toolbarTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );

  static TextStyle labelTextStyle = TextStyle(
    color: Palette.primaryTextColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
  );

  static InputDecoration outlineInputDecoration(
          {String? error, VoidCallback? onTap, String? labelText}) =>
      InputDecoration(
        errorText: error,
        isDense: true,
        labelText: labelText,
        hintText: labelText,
        hintStyle: Styles.inputHintTextStyle,
        labelStyle: Styles.inputHintTextStyle.copyWith(color: Palette.gray40),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIconConstraints: BoxConstraints(maxWidth: 50.w),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Palette.primaryColor, width: 1.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Palette.secondaryTextColor, width: 1.0),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Palette.secondaryTextColor, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          borderSide: BorderSide(color: Palette.primaryTextColor, width: 1.0),
        ),
      );
}
