import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  var screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  var screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

// Padding begin.
const double kDefaultPadding = 16.0;

const double kTextPadding = 4.0;
// Padding end.

// Screen width begin.
const double kScreenWidthSm = 576.0;

const double kScreenWidthMd = 768.0;

const double kScreenWidthLg = 992.0;

const double kScreenWidthXl = 1200.0;

const double kScreenWidthXxl = 1400.0;
// Screen width end.

// Dialog width begin.
const double kDialogWidth = 460.0;
const double kDialogheight = 600.0;
// Dialog width end.
