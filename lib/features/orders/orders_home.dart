import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/models/order_model.dart';
import 'package:flutter_assessment/features/home/widgets/banner_widget.dart';
import 'package:flutter_assessment/features/orders/order_detail.dart';
import 'package:flutter_assessment/shared/components/cached_network_image.dart';
import 'package:flutter_assessment/shared/components/custom_outlined_button.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/constants/assets.dart';
import 'package:flutter_assessment/shared/constants/colors.dart';
import 'package:flutter_assessment/shared/constants/size_config.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersHomeScreen extends StatefulWidget {
  static const routeName = 'orders-home';
  const OrdersHomeScreen({super.key});

  @override
  State<OrdersHomeScreen> createState() => _OrdersHomeScreenState();
}

class _OrdersHomeScreenState extends State<OrdersHomeScreen> {
  List<String> tabs = ['Pending', 'Delivered', 'Cancelled'];
  String active = 'Delivered';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.whiteColor,
        leading: const CustomImageWidget(
          Assets.drawerIcon,
          height: 10,
          width: 10,
        ),
        centerTitle: true,
        title: CustomTextWidget(
          'My Orders',
          Styles.normalTextStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: CustomImageWidget(
              Assets.notificationIcon,
              // height: 10,
              // width: 10,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, index) {
                    final item = tabs[index];

                    return InkWell(
                      onTap: () {
                        setState(() {
                          active = item;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: active == item
                                ? Palette.black
                                : Palette.whiteColor,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item,
                                  style: TextStyle(
                                      color: active == item
                                          ? Palette.whiteColor
                                          : Palette.black,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: ordersList.length,
                  itemBuilder: (context, index) {
                    final order = ordersList[index];
                    return Card(
                      color: Palette.whiteColor,
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: SizedBox(
                          width: SizeConfig.screenWidth * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BannerHeaderWidget(
                                  leadingTitle: order.name,
                                  trailingTitle: order.date),
                              SizedBox(
                                height: 15.h,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 36),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Tracking number: ',
                                        style: TextStyle(
                                            color: Palette.gray70,
                                            fontSize: 14.sp)),
                                    TextSpan(
                                        text: order.trackingNumber,
                                        style: TextStyle(
                                            color: Palette.black,
                                            fontSize: 14.sp)),
                                  ],
                                ),
                                // textScaler: const TextScaler.linear(0.5),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 36),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Quantity: ',
                                            style: TextStyle(
                                                color: Palette.gray70,
                                                fontSize: 14.sp)),
                                        TextSpan(
                                            text: order.quantity.toString(),
                                            style: TextStyle(
                                                color: Palette.black,
                                                fontSize: 14.sp)),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 36),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'Subtotal: ',
                                            style: TextStyle(
                                                color: Palette.gray70,
                                                fontSize: 14.sp)),
                                        TextSpan(
                                            text: '\$ ${order.subtotal} ',
                                            style: TextStyle(
                                                color: Palette.black,
                                                fontSize: 14.sp)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                    'Delivered',
                                    Styles.normalTextStyle.copyWith(
                                      fontSize: 20.sp,
                                      color: Palette.secondaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                    child: CustomOutlinedButton(
                                      text: 'Details',
                                      textColor: Palette.gray80,
                                      borderColor: Palette.gray80,
                                      isBtnEnabled: true,
                                      // isFilled: true,
                                      // backgroundColor: Palette.shadowColor,
                                      press: () {
                                        Navigator.pushNamed(
                                          context,
                                          OrderDetailScreen.routeName,
                                          arguments: order,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
