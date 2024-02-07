import 'package:fimber/fimber.dart';
import 'package:flutter_assessment/core/models/products_model.dart';

abstract class ProductRepository {
  Future<List<Product>?> getAllProducts();
  Future<List<Product>?> getFeaturedProducts();
  Future<List<Product>?> getRecommendedProducts();
}

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl();

  @override
  Future<List<Product>?> getAllProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        Fimber.d('ITEMS $searchProductsList');
        return searchProductsList;
      });
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<Product>?> getFeaturedProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        Fimber.d('ITEMS $searchProductsList');
        return featuredProductsList;
      });
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<Product>?> getRecommendedProducts() async {
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return featuredProductsList;
      });
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
