import 'package:flutter/material.dart';
import 'package:flutter_assessment/core/models/order_model.dart';
import 'package:flutter_assessment/features/home/home_screen.dart';
import 'package:flutter_assessment/features/landing_home_screen.dart';
import 'package:flutter_assessment/features/orders/order_detail.dart';
import 'package:flutter_assessment/features/products/all_products_screen.dart';
import 'package:flutter_assessment/features/splash/splash_page.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class GemStoreRouter {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const SplashPage();
          },
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const HomeScreen();
          },
        );
      case LandingHomeScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const LandingHomeScreen();
          },
        );
      case AllProductsScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            return const AllProductsScreen();
          },
        );
      case OrderDetailScreen.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            final order = settings.arguments as Order;
            return OrderDetailScreen(order: order);
          },
        );
    }
    return null;
  }
}
