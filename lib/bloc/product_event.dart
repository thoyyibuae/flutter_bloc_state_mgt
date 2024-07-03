part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductList extends ProductEvent {}


class UpdateProducts extends ProductEvent {
  // final Product product;

  // final ApiRes product;

  final BookModel product;


  const UpdateProducts(this.product);

  @override
  List<Object> get props => [product];


  // ProductState
  // copyWith({required List<BookModel> allTask, String? taskId, required BookModel task,
  //   required int index, required UpdateProducts state}) {}


}
