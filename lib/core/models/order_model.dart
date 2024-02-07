import 'package:flutter_assessment/core/models/products_model.dart';

class Order {
  String name;
  int id;
  int subtotal;
  int quantity;
  String trackingNumber;
  String date;
  String address;
  List<Product> productList;

  Order({
    required this.name,
    required this.id,
    required this.quantity,
    required this.date,
    required this.subtotal,
    required this.trackingNumber,
    required this.productList,
    required this.address,
  });
}

List<Order> ordersList = [
  Order(
    name: "Order #1514",
    id: 1,
    trackingNumber: 'IK987362341',
    quantity: 2,
    subtotal: 110,
    date: '13/05/2021',
    productList: featuredProductsList,
    address: 'SBI Building, Software Park',
  ),
  Order(
    name: "Order #1679",
    id: 1,
    trackingNumber: ' IK3873218890',
    quantity: 3,
    subtotal: 450,
    date: '12/05/2020',
    productList: featuredProductsList,
    address: 'SBI Building, Software Park',
  ),
  Order(
    name: "ORDER #1671",
    id: 1,
    trackingNumber: 'IK237368881',
    quantity: 3,
    subtotal: 400,
    date: '10/05/2020',
    productList: featuredProductsList,
    address: 'SBI Building, Software Park',
  ),
];
