
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/book_model.dart';
import '../models/cart.dart';
import '../models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState>
{
  CartBloc() : super(CartInitial()) {
    on<LoadProductCounter>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded(cart: Cart()));
    });
    on<AddProduct>((event, emit) {

      if (state is CartLoaded) {
        final state = this.state as CartLoaded;
        emit(CartLoaded(
            cart: Cart(
                products_new: List.from(state.cart.products_new)..add(event.product))));
      }
    });

    on<UpdateProduct>((event, emit) {
      if (state is CartLoaded) {

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

        final int index = state.products!.indexWhere((item) => item.sId == task.sId);

        state.products!.removeWhere((item) => item.sId == task.sId);

        print("The given index is : ${index}");
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
      }
    });


    on<RemoveProduct>((event, emit) {
      if (state is CartLoaded) {
        final state = this.state as CartLoaded;
        emit(CartLoaded(
            cart: Cart(
                products_new: List.from(state.cart.products_new)
                  ..remove(event.product))));
      }
    });
  }

}
