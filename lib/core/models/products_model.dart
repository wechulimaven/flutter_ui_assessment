import 'package:flutter_assessment/shared/constants/assets.dart';

class Product {
  String name;
  int id;
  int? ratings;
  double cost;
  double? discount;
  String imageUrl;
  bool isFavorite;

  Product(
      {required this.name,
      required this.id,
      required this.cost,
      required this.imageUrl,
      this.ratings,
      this.discount,
      required this.isFavorite});
}

List<Product> featuredProductsList = [
  Product(
    name: 'Turtleneck Sweater ',
    id: 1,
    cost: 39.99,
    imageUrl: Assets.lady1,
    isFavorite: true,
  ),
  Product(
      name: 'Long Sleeve Dress',
      id: 2,
      cost: 45,
      imageUrl: Assets.lady2,
      isFavorite: false),
  Product(
      name: 'Sportsware',
      id: 3,
      cost: 80,
      imageUrl: Assets.lady3,
      isFavorite: false),
];

List<Product> searchProductsList = [
  Product(
    name: 'Linen Dress',
    id: 1,
    cost: 52.00,
    discount: 90.00,
    imageUrl: Assets.search1,
    isFavorite: true,
    ratings: 64,
  ),
  Product(
    name: 'Filted Waist Dress',
    id: 2,
    cost: 47.99,
    discount: 82.00,
    imageUrl: Assets.search2,
    isFavorite: false,
    ratings: 53,
  ),
  Product(
    name: 'Maxi Dress',
    id: 3,
    cost: 68.00,
    imageUrl: Assets.search3,
    isFavorite: false,
    ratings: 46,
  ),
  Product(
    name: 'Front Tie Mini Dress',
    id: 4,
    cost: 59.00,
    imageUrl: Assets.search4,
    isFavorite: true,
    ratings: 38,
  ),
  Product(
    name: 'Ohara Dress',
    id: 5,
    cost: 85.00,
    imageUrl: Assets.search5,
    isFavorite: true,
    ratings: 50,
  ),
  Product(
    name: 'Tie Back Mini Dress',
    id: 6,
    cost: 67.00,
    imageUrl: Assets.search6,
    isFavorite: true,
    ratings: 39,
  ),
  Product(
    name: 'Leaves Green Dress',
    id: 7,
    cost: 64.00,
    imageUrl: Assets.search7,
    isFavorite: false,
    ratings: 83,
  ),
  Product(
    name: 'Off Shoulder Dress',
    id: 8,
    cost: 79.99,
    imageUrl: Assets.search8,
    isFavorite: false,
    ratings: 25,
  ),
];
