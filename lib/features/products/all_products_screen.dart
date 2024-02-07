import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/blocs/products/product_cubit.dart';
import 'package:flutter_assessment/core/di/injector.dart';
import 'package:flutter_assessment/core/models/products_model.dart';
import 'package:flutter_assessment/shared/components/cached_network_image.dart';
import 'package:flutter_assessment/shared/components/custom_text_widget.dart';
import 'package:flutter_assessment/shared/components/shimmer_widget.dart';
import 'package:flutter_assessment/shared/constants/colors.dart';
import 'package:flutter_assessment/shared/constants/styles.dart';
import 'package:flutter_assessment/shared/utils/toast_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProductsScreen extends StatefulWidget {
  static const routeName = 'app-products';
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  String _selectedItem = 'Filter';
  List<int> favoritesIds = [1, 4, 5, 6];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inject.get<ProductsCubit>()..getFeaturedProducts(),
      child: Scaffold(
        appBar: AppBar(
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
            "Dresses",
            Styles.normalTextStyle.copyWith(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Palette.gray80,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      "Found\n152 Results",
                      Styles.normalTextStyle.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Palette.gray90,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Palette.gray60, width: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedItem = newValue;
                              });
                            }
                          },
                          items: <String>[
                            'Filter',
                            'Item 2',
                            'Item 3',
                            'Item 4'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: BlocConsumer<ProductsCubit, ProductState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is SuccessProductState) {
                      return GridView.count(
                        crossAxisCount: 2, // 2 items per row
                        childAspectRatio: 0.7,

                        children: searchProductsList.map((item) {
                          bool isFavorite = favoritesIds.contains(item.id);
                          return Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (isFavorite) {
                                        favoritesIds.remove(item.id);
                                        ToastUtils.showSuccessToast(
                                            '${item.name} removed from favorites');
                                      } else {
                                        favoritesIds.add(item.id);
                                        ToastUtils.showSuccessToast(
                                            '${item.name} added to favorites');
                                      }
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15.0)),
                                        child: CustomImageWidget(
                                          width: 140.h,
                                          height: 160.w,
                                          item.imageUrl,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Positioned(
                                          top: 7,
                                          right: 10,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Palette.whiteColor,
                                                shape: BoxShape.circle),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Icon(
                                                Icons.favorite,
                                                color: isFavorite
                                                    ? Palette.warningDark
                                                    : Palette.gray60,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                CustomTextWidget(
                                  item.name,
                                  Styles.normalTextStyle.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Palette.gray90,
                                  ),
                                ),
                                Row(
                                  children: [
                                    CustomTextWidget(
                                      '\$ ${item.cost}',
                                      Styles.normalTextStyle.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800,
                                        color: Palette.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    if (item.discount != null)
                                      CustomTextWidget(
                                        '\$ ${item.discount}',
                                        Styles.normalTextStyle.copyWith(
                                            fontSize: 9.sp,
                                            // fontWeight: FontWeight.w700,
                                            color: Palette.gray70,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: item.ratings! / 12,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 10,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star_outline_outlined,
                                        color: Palette.secondaryColor,
                                      ),
                                      onRatingUpdate: (rating) {
                                        // print(rating);
                                      },
                                    ),
                                    CustomTextWidget(
                                      '(${item.ratings})',
                                      Styles.normalTextStyle.copyWith(
                                        fontSize: 9.sp,
                                        // fontWeight: FontWeight.w700,
                                        color: Palette.gray70,
                                      ),
                                      padding: 0,
                                    ),
                                  ],
                                )
                              ],
                            )),
                          );
                        }).toList(),
                      );
                    }

                    if (state is ErrorProductState) {
                      return const Text('Error');
                    }
                    return const ShimmerLoadingScreen(
                      scrollDirection: Axis.vertical,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
