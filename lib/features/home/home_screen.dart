import 'package:carousel_slider/carousel_slider.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/blocs/products/product_cubit.dart';
import 'package:flutter_assessment/core/di/injector.dart';
import 'package:flutter_assessment/core/models/carouse_model.dart';
import 'package:flutter_assessment/core/models/categories_model.dart';
import 'package:flutter_assessment/core/models/products_model.dart';
import 'package:flutter_assessment/features/home/widgets/item_widget.dart';
import 'package:flutter_assessment/shared/components/cached_network_image.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/components/shimmer_widget.dart';
import 'package:flutter_assessment/shared/constants/assets.dart';
import 'package:flutter_assessment/shared/constants/colors.dart';
import 'package:flutter_assessment/shared/constants/size_config.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/banner_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreen/';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategoryId = 1;
  int? _current;
  CarouselController controller = CarouselController();

  // final _productsCubit = inject.get<ProductsCubit>();

  @override
  void initState() {
    // _productsCubit.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject.get<ProductsCubit>()..getFeaturedProducts(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.whiteColor,
          leading: const CustomImageWidget(
            Assets.drawerIcon,
            height: 10,
            width: 10,
          ),
          centerTitle: true,
          title: CustomTextWidget(
            'GemStore',
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
        backgroundColor: Palette.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.12,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (_, index) {
                      final Categories category = categoryList[index];
                      final id = category.id;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 30, 14),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCategoryId = id;
                                });
                              },
                              child: Container(
                                width: selectedCategoryId == id ? 43 : null,
                                height: selectedCategoryId == id ? 43 : null,
                                decoration: BoxDecoration(
                                  border: selectedCategoryId == id
                                      ? Border.all(
                                          color: Palette.black,
                                        )
                                      : null,
                                  color: Palette.whiteColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: selectedCategoryId == id
                                          ? Palette.black
                                          : Palette.gray30,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CustomImageWidget(
                                        category.imageUrl,
                                        color: selectedCategoryId == id
                                            ? Palette.whiteColor
                                            : Palette.gray60,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              curoselWidget(context),
              SizedBox(
                height: 10.h,
              ),
              const Padding(
                padding: EdgeInsets.all(13.0),
                child: BannerHeaderWidget(
                    leadingTitle: "Featured Products",
                    trailingTitle: "Show all"),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: SizedBox(
                  height: 230.h,
                  child: BlocConsumer<ProductsCubit, ProductState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is SuccessProductState) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: featuredProductsList.length,
                            itemBuilder: (_, index) {
                              final item = featuredProductsList[index];

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ItemWidget(
                                  item: item,
                                ),
                              );
                            });
                      }

                      if (state is ErrorProductState) {
                        return const Text('Error');
                      }
                      return const ShimmerLoadingScreen(
                        scrollDirection: Axis.horizontal,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomImageWidget(
                // width: 120.h,
                height: 160.w,
                Assets.banner_2,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10.h,
              ),
              const Padding(
                padding: EdgeInsets.all(13.0),
                child: BannerHeaderWidget(
                  leadingTitle: "Recommended",
                  trailingTitle: "Show all",
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: BlocConsumer<ProductsCubit, ProductState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is SuccessProductState) {
                      return SizedBox(
                        height: 90.h,
                        width: SizeConfig.screenWidth,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: featuredProductsList.length,
                            itemBuilder: (_, index) {
                              final item = featuredProductsList[index];

                              return SizedBox(
                                height: 80.h,
                                width: 240.w,
                                child: Card(
                                  color: Palette.whiteColor,
                                  elevation: 0.28,
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15.0)),
                                      child: CustomImageWidget(
                                        // width: 120.h,
                                        // height: 160.w,
                                        item.imageUrl,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    title: CustomTextWidget(
                                      item.name,
                                      Styles.normalTextStyle.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Palette.gray90,
                                      ),
                                    ),
                                    subtitle: CustomTextWidget(
                                      '\$ ${item.cost}',
                                      Styles.normalTextStyle.copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Palette.gray90,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }

                    if (state is ErrorProductState) {
                      return const Text('Error');
                    }
                    return ShimmerLoadingScreen(
                      height: 125.h,
                      width: 240.w,
                      scrollDirection: Axis.horizontal,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Padding(
                padding: EdgeInsets.all(13.0),
                child: BannerHeaderWidget(
                  leadingTitle: "Top Collection",
                  trailingTitle: "Show all",
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomImageWidget(
                // width: 120.h,
                // height: 160.w,
                Assets.collection_1,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomImageWidget(
                // width: 120.h,
                // height: 160.w,
                Assets.collection_2,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomImageWidget(
                // width: 120.h,
                // height: 160.w,
                Assets.collection_3,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
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
                left: 150,
                top: 15,
                child: SizedBox(
                  width: 100,
                  child: CustomTextWidget(
                    e.text,
                    Styles.normalTextStyle.copyWith(
                      color: Palette.whiteColor,
                      fontSize: 22.sp,
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
