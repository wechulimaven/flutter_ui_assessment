import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/models/carouse_model.dart';
import 'package:flutter_assessment/features/home/home_screen.dart';
import 'package:flutter_assessment/features/orders/orders_home.dart';
import 'package:flutter_assessment/features/products/all_products_screen.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/constants/colors.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingHomeScreen extends StatefulWidget {
  static const routeName = 'LandingHomeScreen/';
  const LandingHomeScreen({super.key});

  @override
  State<LandingHomeScreen> createState() => _LandingHomeScreenState();
}

class _LandingHomeScreenState extends State<LandingHomeScreen> {
  int selectedCategoryId = 1;
  int? _current;
  CarouselController controller = CarouselController();

  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.shopping_bag_outlined,
    Icons.person_outlined,
  ];
  final widgets = [
    const HomeScreen(),
    const AllProductsScreen(),
    const OrdersHomeScreen(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: widgets[_bottomNavIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Palette.black : Palette.gray60;
          return Icon(
            iconList[index],
            size: 24,
            color: color,
          );
        },
        backgroundColor: Palette.whiteColor,
        activeIndex: _bottomNavIndex,
        splashSpeedInMilliseconds: 300,
        gapLocation: GapLocation.none,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }

  CarouselSlider curoselWidget(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      items: carouselSlider.map((e) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(e.imageUrl),
                  ),
                ),
              ),
              // SizedBox(
              //   width: 800,
              //   // height: 400,
              //   child: CustomImageWidget(
              //     e.imageUrl,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Positioned(
                left: 160,
                top: 15,
                child: SizedBox(
                  width: 100,
                  child: CustomTextWidget(
                    e.text,
                    Styles.normalTextStyle.copyWith(
                      color: Palette.whiteColor,
                      fontSize: 19.sp,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0, right: 0,
                // top: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carouselSlider.map(
                    (image) {
                      //these two lines
                      int index = carouselSlider.indexOf(image); //are changed
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: _current == index ? 10.0 : null,
                          height: _current == index ? 10.0 : null,
                          decoration: BoxDecoration(
                            border: _current == index
                                ? Border.all(
                                    color: Palette.whiteColor,
                                  )
                                : null,
                            color: Palette.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 2.0,
                            ),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Palette.whiteColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      options: CarouselOptions(onPageChanged: (val, _) {
        setState(() {
          _current = val;
        });
      }),
    );
  }
}
