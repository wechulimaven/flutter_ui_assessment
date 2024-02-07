import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/models/order_model.dart';
import 'package:flutter_assessment/core/models/products_model.dart';
import 'package:flutter_assessment/features/landing_home_screen.dart';
import 'package:flutter_assessment/shared/components/cached_network_image.dart';
import 'package:flutter_assessment/shared/components/custom_outlined_button.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/constants/assets.dart';
import 'package:flutter_assessment/shared/constants/colors.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailScreen extends StatefulWidget {
  static const routeName = 'order-detail';
  final Order order;
  const OrderDetailScreen({super.key, required this.order});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  Order get order => widget.order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: const ClipOval(
                child: Icon(Icons.arrow_back_ios_new_outlined),
              ),
            ),
          ),
        ),
        title: CustomTextWidget(
          order.name,
          Styles.normalTextStyle.copyWith(
            fontSize: 16.sp,
            // fontWeight: FontWeight.w300,
            color: Palette.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: Palette.gray70,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        'Your order is delivered',
                        Styles.normalTextStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Palette.whiteColor,
                        ),
                      ),
                      CustomTextWidget(
                        'Rate product to get 5 points for collect.',
                        Styles.normalTextStyle.copyWith(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          color: Palette.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  const CustomImageWidget(Assets.success)
                ],
              ),
            ),
          ),
          SizedBox(height: 22.h),
          Card(
            color: Palette.whiteColor,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTile(title: "Order number", value: order.name),
                    CustomTile(
                        title: "Tracking Number", value: order.trackingNumber),
                    CustomTile(title: "Delivery address", value: order.address),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 22.h),
          Card(
            color: Palette.whiteColor,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (Product item in order.productList)
                      CustomTile(
                          fontSize: 16.sp,
                          titleFontSize: 14.sp,
                          title: item.name,
                          sub: 'X${order.quantity}',
                          value: '\$ ${item.cost}'),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomTile(
                        titleFontSize: 14.sp,
                        fontSize: 16.sp,
                        value: '\$ 120.00',
                        title: 'Subtotal'),
                    CustomTile(
                        titleFontSize: 14.sp,
                        fontSize: 16.sp,
                        value: '\$ 0.00',
                        title: 'Shipping'),
                    const Divider(
                      color: Palette.gray60,
                    ),
                    CustomTile(
                        titleFontSize: 14.sp,
                        fontSize: 16.sp,
                        value: '\$ 120.00',
                        title: 'Total'),
                    SizedBox(
                      height: 14.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150.w,
                child: CustomOutlinedButton(
                  text: 'Return Home',
                  textColor: Palette.gray70,
                  borderColor: Palette.gray70,
                  isBtnEnabled: true,
                  press: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, LandingHomeScreen.routeName, (route) => false);
                  },
                ),
              ),
              SizedBox(
                width: 50.w,
              ),
              SizedBox(
                width: 100.w,
                child: CustomOutlinedButton(
                  text: 'Rate',
                  textColor: Palette.whiteColor,
                  borderColor: Palette.gray90,
                  isBtnEnabled: true,
                  isFilled: true,
                  backgroundColor: Palette.gray90,
                  press: () {},
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final String title;
  final String? sub;
  final String value;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? titleFontSize;
  const CustomTile({
    super.key,
    required this.value,
    required this.title,
    this.fontWeight,
    this.sub,
    this.fontSize,
    this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomTextWidget(
          title,
          Styles.normalTextStyle.copyWith(
            fontSize: titleFontSize ?? 12.sp,
            color: Palette.gray70,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (sub != null)
              CustomTextWidget(
                sub!,
                Styles.normalTextStyle.copyWith(
                  fontSize: fontSize ?? 12.sp,
                  color: Palette.gray70,
                ),
              ),
            SizedBox(
              width: 25.w,
            ),
            CustomTextWidget(
              value,
              Styles.normalTextStyle.copyWith(
                fontSize: fontSize ?? 12.sp,
                fontWeight: fontWeight,
                color: Palette.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
