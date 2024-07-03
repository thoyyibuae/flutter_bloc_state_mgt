
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../models/book_model.dart';
import '../models/product.dart';
import '../utils/palette.dart';
import '../utils/spacing.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 40),
              child: const Text(
                "Shopping Cart",
                style: TextStyle(
                    color: Palette.primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
           Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                color: Palette.primaryColor.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      Widget widget = Container();

                      
                      if (state is CartLoaded) {
                        if (state.cart.products_new.isEmpty) {
                          widget = SizedBox(
                            height: getHeight(context) / 1.55,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Palette.primaryColor,
                                  size: 100,
                                ),
                                Text("Your cart is currently \n empty!",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Palette.textColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          );
                        } else {
                          widget = Column(
                            children: [
                              _buildListProduct(),
                              Spacing(
                                height: 10,
                              ),
                              const Divider(
                                color: Palette.primaryColor,
                                thickness: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Total",
                                      style: TextStyle(
                                          color: Palette.textColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text('Rs. ${state.cart.products_new}',
                                        style: const TextStyle(
                                            color: Palette.textColor,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                  )
                                ],
                              )
                            ],
                          );
                        }
                      }
                      return widget;
                    },
                  ),
                    Spacing(
                      height: 20,
                    ),
                    Container(
                        height: 50,
                        margin: const EdgeInsets.all(20.0),
                        width: getWidth(context),
                        child: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            bool cartEmpty = false;
                            if (state is CartLoaded) {
                              if (state.cart.products_new.isEmpty) {
                                cartEmpty = true;
                              } else {
                                cartEmpty = false;
                              }
                            }
                            return ElevatedButton(
                              child: Text(cartEmpty ? "Browse Items" : "Checkout",
                                  style: const TextStyle(
                                      color: Palette.white, fontSize: 20.0)),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Palette.primaryColor,
                                onPrimary: Palette.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onPressed: () {
                                cartEmpty
                                    ? Navigator.of(context)
                                        .pushNamedAndRemoveUntil('/home',
                                            (Route<dynamic> route) => false)
                                    : ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Feature under development!"),
                                        ),
                                      );
                              },
                            );
                          },
                        )),
                  ],
                ),
              ),

          ],
        ),
      ),
    );
  }

  Widget _buildListProduct() {
    return SizedBox(
      height: getHeight(context) / 1.75,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return _buildLoading();
          }
          if (state is CartLoaded) {
            return _buildCard(context, state.cart.products_new);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      // List<ApiRes> products
      List<BookModel> products_new

      ) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      shrinkWrap: true,
      itemCount: products_new.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color:
                  index.floor().isEven ? Palette.pageColor : Palette.pageColor2,
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.network(
                  //   products[index].imageUrl.toString(),
                  //   cacheHeight: 70,
                  // ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products_new[index].name.toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Palette.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacing(height: 10),

                        Text(
                          "Rs.  + ${products_new[index].name ??""}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Palette.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      context
                          .read<CartBloc>()
                          .add(RemoveProduct(products_new[index]));
                    },
                    child: const Icon(
                      Icons.close,
                      color: Palette.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
