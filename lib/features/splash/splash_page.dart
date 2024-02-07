// ignore_for_file: library_private_types_in_public_api

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/landing_home_screen.dart';
import 'package:flutter_assessment/shared/components/custom_outlined_button.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/constants/assets.dart';
import '../../shared/constants/colors.dart';
import '../../shared/utils/screen_util.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'SplashPage';

  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with AfterLayoutMixin<SplashPage> {
  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    setUpScreenUtil(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Center(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
              opacity: 2,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
              image: AssetImage(Assets.onboarding),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  'Welcome to GemStore!',
                  Styles.normalTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Palette.whiteColor,
                      fontSize: 25.sp),
                  padding: 250,
                ),
                CustomTextWidget(
                  ' The home for a fashionista',
                  Styles.normalTextStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Palette.whiteColor,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 70.h,
                ),
                SizedBox(
                  width: 170.w,
                  child: CustomOutlinedButton(
                    text: 'Get Started',
                    isBtnEnabled: true,
                    isFilled: true,
                    backgroundColor: Palette.shadowColor,
                    press: () {
                      Navigator.pushNamed(context, LandingHomeScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
