import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double? padding;
  final double? wordSpacing;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  const CustomTextWidget(
    this.text,
    this.style, {
    Key? key,
    this.padding,
    this.textAlign,
    this.overflow,
    this.wordSpacing,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: padding ?? 8.0.sm),
        child: Text(
          text,
          softWrap: true,
          style: style,
          maxLines: maxLines,
          
          //  TextStyle(
          //     color: color,
          //     fontSize: fontSize ?? 12.0,
          //     wordSpacing: wordSpacing,
          //     fontWeight: fontWeight),
          textAlign: textAlign,
        ));
  }
}
