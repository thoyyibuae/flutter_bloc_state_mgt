
import 'package:flutter/material.dart';

import '../models/product.dart';

class Arguments {
  final Color pageColor;
  final List<Product> products;
  final String categoryName;
  final Product product;

  Arguments(this.pageColor, this.products, this.categoryName, this.product);
}
