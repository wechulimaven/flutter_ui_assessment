import 'package:flutter/material.dart';
import 'package:flutter_assessment/features/products/all_products_screen.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/constants/colors.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerHeaderWidget extends StatelessWidget {
  final String leadingTitle;
  final String trailingTitle;
  const BannerHeaderWidget({
    super.key,
    required this.leadingTitle,
    required this.trailingTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          leadingTitle,
          Styles.normalTextStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: Palette.gray90,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AllProductsScreen.routeName);
          },
          child: CustomTextWidget(
            trailingTitle,
            Styles.normalTextStyle.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
              color: Palette.gray70,
            ),
          ),
        )
      ],
    );
  }
}
