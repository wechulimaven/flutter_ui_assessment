import 'package:flutter_assessment/shared/constants/assets.dart';

class Categories {
  String name;
  int id;
  String imageUrl;
  bool isSelected;

  Categories(
      {required this.name,
      required this.id,
      required this.imageUrl,
      required this.isSelected});
}

List<Categories> categoryList = [
  Categories(
    name: 'Women',
    id: 1,
    imageUrl: Assets.femaleIcon,
    isSelected: true,
  ),
  Categories(name: 'Men', id: 2, imageUrl: Assets.maleIcon, isSelected: false),
  Categories(
      name: 'Accessories',
      id: 3,
      imageUrl: Assets.accessoriesIcon,
      isSelected: false),
  Categories(
      name: 'Beauty', id: 4, imageUrl: Assets.beautyIcon, isSelected: false),
];
