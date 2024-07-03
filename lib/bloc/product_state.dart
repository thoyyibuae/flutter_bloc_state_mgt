part of 'product_bloc.dart';

// abstract
class ProductState extends Equatable {
  // const ProductState();

  final List<BookModel>? products;

  const ProductState({this.products = const <BookModel>[], dynamic taskId});

  ProductState

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
      ProductState(
        taskId: taskId,
        products: products ??  List<BookModel>.
        from(state.allTasks!)..insert(index,task!),
      );


  }

  @override
  List<Object> get props => [products!,identityHashCode(this)
  ];



  // @override
  // List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  // final ResponseModel responseModel;
  final ResModel responseModel;
  const ProductLoaded(this.responseModel);
}

class ProductError extends ProductState {
  final String? message;
  const ProductError(this.message);
}
