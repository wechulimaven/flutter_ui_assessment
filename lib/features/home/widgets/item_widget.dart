import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/models/products_model.dart';
import 'package:flutter_assessment/shared/components/cached_network_image.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/constants/colors.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemWidget extends StatelessWidget {
  final Product item;
  const ItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          child: CustomImageWidget(
            width: 120.h,
            height: 160.w,
            item.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        CustomTextWidget(
          item.name,
          Styles.normalTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: Palette.black,
          ),
        ),
        CustomTextWidget(
          '\$ ${item.cost}',
          Styles.normalTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w900,
            color: Palette.black,
          ),
        )
      ],
    );
  }
}
