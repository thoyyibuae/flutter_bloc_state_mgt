
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';import '../models/ResponseModel.dart';


import '../models/book_model.dart';
import '../product_repository/api_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetProductList>((event, emit) async {
      try {

        emit(ProductLoading());

        final mList = await _apiRepository.fetchApiList();

        // final mList = await _apiRepository.fetchProductList();
        emit(ProductLoaded(mList));
        // emit(ProductLoaded(mList));
        if (state is UpdateProducts) {
          final state = this.state as UpdateProducts;
          // emit(ProductLoaded(
          //     List.from(state.responseModel.datas)..add(mList)));


          final int index = mList.datas!.indexWhere((item) => item.sId.toString()
              == state.product.sId.toString());
          print("The given index is : ${index}");

          mList.datas!.removeWhere((item) => item.sId == state.product.sId);

          emit(ProductState(

              products: mList.datas!,
              taskId: state.product.sId,
              // task: state.product,
              // index: index,
              // state: state
          )
      );




        }

        if (mList.error != null)
        {
          emit(ProductError(mList.error));
        }
        else{

        }


      } on NetworkError {
        emit(
            const ProductError("Failed to fetch data. is your device online ?"));
      }
    });



    on<UpdateProducts>((event, emit) {
      // if (state is CartLoaded) {

        final state = this.state;
        final task = event.product;

        print("The given id is : ${task.sId}");

        // state.!.forEach((el) {
        //   // print("The item is :${el.id}");
        //   // emit(TaskState(
        //   //   allTasks: List<TaskModel>.
        //   //   from(state.allTasks!)..insert(index,event.task!),
        //   // ));
        // });
        state.products!.forEach((element) {
          print(element.sId);
        });
        print(state.products!.length);

        final int index = state.products!.indexWhere((item) => item.sId.toString() == task.sId.toString());
        print("The given index is : ${index}");

        state.products!.removeWhere((item) => item.sId == task.sId);


        // return;
        // emit(TaskState(
        //     allTasks: allTasks
        // ));
        // allTasks?.insert(index, task!);

        emit(state.copyWith(
            allTask: state.products!,
            taskId: task.sId,
            task: task,
            index: index,
            state: state));
        // final state = this.state as CartLoaded;
        // emit(CartLoaded(
        //     cart: Cart(
        //         products: List.from(state.cart.products)
        //           ..remove(event.product))));
      // }
    });
  }
}
