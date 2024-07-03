
import 'package:flutter/material.dart';
import 'package:flutter_bloc_trial/models/book_model.dart';

import '../main.dart';
import '../models/product.dart';
import '../pages/cart_page.dart';
import '../pages/category_page.dart';
import '../pages/home_page.dart';
import '../pages/product_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RoutePaths.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RoutePaths.cartPage:
        return MaterialPageRoute(builder: (_) =>  CartPage());
      case RoutePaths.categoryPage:
        return MaterialPageRoute(
            builder: (_) => CategoryPage(
                products_new: args as List<BookModel>, categoryName: args as String));
      case RoutePaths.productPage:
        return MaterialPageRoute(
            builder: (_) => ProductPage(
                product_new: args as BookModel, pageColor: args as Color));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class RoutePaths {
  static const String splashScreen = '/';
  static const String homePage = '/home';
  static const String categoryPage = '/category';
  static const String productPage = '/product';
  static const String cartPage = '/cart';
}
