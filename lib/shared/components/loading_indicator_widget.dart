import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../constants/colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,

          /// Required, The loading type of the widget
          colors: [Palette.primaryColor, Palette.secondaryColor],

          /// Optional, The color collections
          strokeWidth: 1,

          /// Optional, The stroke of the line, only applicable to widget which contains line
          backgroundColor: Colors.transparent,

          /// Optional, Background of the widget
          pathBackgroundColor: Colors.transparent

          /// Optional, the stroke backgroundColor
          ),
    );
  }
}

class LoadingIndicatorSpiralWidget extends StatelessWidget {
  const LoadingIndicatorSpiralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: LoadingIndicator(
          indicatorType: Indicator.ballClipRotateMultiple,

          /// Required, The loading type of the widget
          colors: [Palette.primaryColor, Palette.secondaryColor],

          /// Optional, The color collections
          strokeWidth: 2,

          /// Optional, The stroke of the line, only applicable to widget which contains line
          backgroundColor: Colors.transparent,

          /// Optional, Background of the widget
          pathBackgroundColor: Colors.transparent

          /// Optional, the stroke backgroundColor
          ),
    );
  }
}
