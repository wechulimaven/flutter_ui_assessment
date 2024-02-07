import 'package:flutter_assessment/shared/constants/assets.dart';

class CarouseModel {
  final String imageUrl;
  final String text;
  CarouseModel({required this.imageUrl, required this.text});
}

List<CarouseModel> carouselSlider = [
  CarouseModel(imageUrl: Assets.carosel, text: "Autumn Collection 2021"),
  // CarouseModel(imageUrl: Assets.banner_2, text: "Autumn Collection 2021"),
];
