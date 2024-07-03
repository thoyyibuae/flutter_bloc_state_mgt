part of 'cart_bloc.dart';

// abstract class CartState extends Equatable {

class CartState extends Equatable {
  // const CartState();

  // final List<ApiRes>? products;
  // final dynamic result;

  final List<BookModel>? products;

  const CartState({this.products = const <BookModel>[], dynamic taskId});

  CartState

  copyWith(
      {
        state,
        index,
        BookModel? task,
        List<BookModel>? allTask,
        dynamic taskId,
        // TaskModel? updateTask
      }
      )

  {
    // TaskState(
    //   allTasks: List<TaskModel>.
    //   from(state.allTasks!)..add(event!.task!),
    // )

    return
      CartState(
        taskId: taskId,
        products: products ??  List<BookModel>.
        from(state.allTasks!)..insert(index,task!),
      );


  }

  @override
  List<Object> get props => [products!,identityHashCode(this)
  ];








  // @override
  // List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {



  // const Cart({this.products = const <ApiRes>[]});
  //
  // final List<ApiRes> products;
  //
  // // int get totalPrice =>
  // //     products.fold(0, (total, current) => total + current.price!.toInt());
  //
  // @override
  // List<Object> get props => [products];







  final Cart cart;

  const CartLoaded({required this.cart});

  @override
  List<Object> get props => [cart];

}



