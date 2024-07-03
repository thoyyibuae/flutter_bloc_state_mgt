part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];

}

class LoadProductCounter extends CartEvent
{

}

class AddProduct extends CartEvent {
  // final Product product;
  // final ApiRes product;

  final BookModel product;


  const AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateProduct extends CartEvent {
  // final Product product;

  // final ApiRes product;

  final BookModel product;


  const UpdateProduct(this.product);

  @override
  List<Object> get props => [product];


}

class RemoveProduct extends CartEvent {
  // final Product product;

  // final ApiRes product;
  final BookModel product;

  const RemoveProduct(this.product);

  @override
  List<Object> get props => [product];


}

