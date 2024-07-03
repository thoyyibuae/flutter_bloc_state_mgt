
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_trial/models/book_model.dart';
import 'package:flutter_bloc_trial/models/product.dart';

class Cart extends Equatable {
  const Cart({this.products_new = const <BookModel>[]});

  // final List<ApiRes> products;

  final List<BookModel> products_new;

  // int get totalPrice =>
  //     products.fold(0, (total, current) => total + current.price!.toInt());

  @override
  List<Object> get props => [products_new];


}
