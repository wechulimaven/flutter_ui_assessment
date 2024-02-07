import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../utils/toast_utils.dart';
import 'loading_indicator_widget.dart';

// ignore_for_file: unnecessary_null_in_if_null_operators

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final String? frontIcon;
  final Color? frontIconColor;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? iconSize;
  final Function()? press;
  final bool isLoading;
  final Color backgroundColor;
  final Color borderColor;
  final bool isFilled;
  final bool isBtnEnabled;
  final Color textColor;
  final int? leftPadding;
  final int? rightPadding;
  final int? topPadding;
  final int? bottomPadding;
  const CustomOutlinedButton({
    Key? key,
    required this.text,
    this.frontIcon,
    this.frontIconColor,
    this.press,
    this.isLoading = false,
    required this.isBtnEnabled,
    this.isFilled = false,
    this.backgroundColor = Palette.gray10,
    this.textColor = Palette.primaryColor,
    this.borderColor = Palette.primaryColor,
    this.height,
    this.width,
    this.fontSize,
    this.iconSize,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isBtnEnabled
          ? press ?? null
          : () {
              ToastUtils.showErrorToast(
                  'Meet the required parameters to proceed');
            },
      child: Container(
        height: height ?? 48.h,
        width: width ?? MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.dm),
        decoration: BoxDecoration(
          color: isBtnEnabled
              ? isFilled
                  ? backgroundColor
                  : null
              : Palette.secondaryTealLight,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              frontIcon != null
                  ? SvgPicture.asset(
                      frontIcon!,
                      color: frontIconColor,
                      height: iconSize ?? 18.h,
                    )
                  : const SizedBox.shrink(),
              frontIcon != null
                  ? SizedBox(width: 7.w)
                  : const SizedBox.shrink(),
              isLoading
                  ? const LoadingIndicatorWidget()
                  : Text(
                      text,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: fontSize ?? 16.sp,
                          fontWeight: FontWeight.w700,
                          color: textColor),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
