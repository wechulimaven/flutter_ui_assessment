import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../constants/size_config.dart';
import '../constants/styles.dart';
import 'loading_indicator_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      this.press,
      this.height,
      this.hasBackground = true,
      this.fontSize,
      this.isLoading = false,
      this.loaderSize = 40.0,
      this.frontIcon,
      this.disable = false,
      this.backGroundColor = Palette.secondaryColor,
      this.textColor = Colors.white,
      this.frontIconColor = Colors.white})
      : super(key: key);
  final String text;
  final Function()? press;
  final double? height;
  final bool hasBackground;
  final double? fontSize;
  final double loaderSize;
  final bool isLoading;
  final bool disable;
  final String? frontIcon;
  final Color? backGroundColor;
  final Color? textColor;
  final Color? frontIconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: height ?? getProportionateScreenHeight(48),
      child: TextButton(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle?>(const TextStyle(
              color: Colors.white,
            )),
            backgroundColor: MaterialStateProperty.all<Color?>(!disable
                ? hasBackground
                    ? backGroundColor
                    : Colors.white
                : Palette.backgroundGrey),
            shape: MaterialStateProperty.all<OutlinedBorder?>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)))),
        onPressed: !disable ? press : null,
        child: !isLoading
            ? (frontIcon != null)
                ? Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      SvgPicture.asset(
                        frontIcon!,
                        color: frontIconColor,
                        height: 18.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: Styles.normalTextStyle.copyWith(
                            fontSize:
                                getProportionateScreenWidth(fontSize ?? 18),
                            color: !disable
                                ? hasBackground
                                    ? textColor
                                    : Palette.primaryColor
                                : Palette.gray70),
                      ),
                      const Spacer()
                    ],
                  )
                : Text(
                    text,
                    style: Styles.normalTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(fontSize ?? 18),
                      color: !disable
                          ? hasBackground
                              ? textColor
                              : Palette.primaryColor
                          : Palette.gray60,
                    ),
                  )
            : const LoadingIndicatorWidget(),
      ),
    );
  }
}
