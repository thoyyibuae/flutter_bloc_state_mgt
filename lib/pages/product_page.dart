// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../bloc/product_bloc.dart';
// import '../bloc/product_event.dart';
// import '../bloc/product_state.dart';
//
// class ProductPage extends StatefulWidget {
//   const ProductPage();
//
//   @override
//   State<ProductPage> createState() => _ProductPageState();
// }
//
// class _ProductPageState extends State<ProductPage> {
//
//   @override
//   void initState() {
//     context.read<ProductBloc>().add(GetProductEvent());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: BlocBuilder<ProductBloc, ProductState>(
//         builder: (context, state) {
//           if (state is ProductLoadingState) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (state is ProductLoadedState) {
//             return ListView.separated(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 itemCount: state.products.length,
//                 shrinkWrap: true,
//                 physics: const ScrollPhysics(),
//                 itemBuilder: (BuildContext context, int index) {
//                   final product = state.products[index];
//                   return InkWell(
//                       onTap: () {
//                         showModalBottomSheet(
//                           isScrollControlled: true,
//                           context: context,
//                           builder: (context) {
//                             return Padding(
//                               padding: MediaQuery.of(context).viewInsets,
//                               child:
//
//                                 Column(
//                                   children: [
//                                     Text(product.brand)
//                                   ],
//                                 )
//
//                               // ProductPreview(product: product),
//                             );
//                           },
//                         );
//                       },
//                       child:
//                       Text(product.brand)
//                       // ProductCard(
//                       //   product: product,
//                       // )
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) {
//                   return const Divider();
//                 });
//           } else if (state is ProductEmptyState) {
//             return const Center(
//               child: Text(
//                 "No products found",
//                 style: TextStyle(color: Colors.green),
//               ),
//             );
//           } else if (state is ProductLoadingFailedState) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.network_check_rounded,
//                     color: Colors.blueAccent,
//                     size: 40.0,
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),
//                   Text(
//                     state.errorMessage,
//                     style: TextStyle(
//                         color: Colors.redAccent,
//                         fontSize: 20),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return const SizedBox();
//           }
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_trial/models/book_model.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import '../models/product.dart';
import '../utils/palette.dart';
import '../utils/spacing.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product_new, required this.pageColor})
      : super(key: key);

  // final Product product;
  // final ApiRes product;
  final BookModel product_new;
  final Color pageColor;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: widget.pageColor,
      body:
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.only(top: 30.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Palette.white,
                  )),

              Row(
                children: [
                  const Icon(
                    Icons.share,
                    color: Palette.white,
                  ),
                  Spacing(
                    width: 10.0,
                  ),
                  LikeButton(
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? Palette.red : Palette.white,
                      );
                    },
                  ),
                  IconButton(
                    icon: Stack(
                      children: [
                        const Align(
                          child: Icon(
                            Icons.shopping_cart,
                            color: Palette.white,
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 8,
                              child: BlocBuilder<CartBloc, CartState>(
                                  builder: (context, state) {
                                    Widget widget = Container();
                                    if (state is CartLoaded) {
                                      widget = Text('${state.cart.products_new.length}',
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold));
                                    }
                                    return widget;
                                  }),
                              backgroundColor: Colors.red,
                            ))
                      ],
                    ),
                    onPressed: () => Navigator.of(context).pushNamed('/cart'),
                  )
                ],
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: getHeight(context) / 2.35,
        //   child: Image.network(
        //     widget.product.userId.toString(),
        //   ),
        // ),
        Container(
          width: getWidth(context),
          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              color: Palette.white.withOpacity(0.45),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(

                widget.product_new.name ?? "",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Palette.textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              Spacing(

                height: 10,
              ),
              Table(
                children: [
                  TableRow(children: [
                    const Text("Brand",
                        style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      widget.product_new.name??"",
                      style: const TextStyle(
                          color: Palette.textColor, fontSize: 20),
                    ),
                  ]),
                  TableRow(children: [
                    const Text("Price",
                        style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(widget.product_new.name ??"",
                        style: const TextStyle(
                            color: Palette.textColor, fontSize: 20)),
                  ]),
                  TableRow(children: [
                    const Text("Color",
                        style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text("${widget.product_new.authorName ??""}",
                        style: const TextStyle(
                            color: Palette.textColor, fontSize: 20)),
                  ]),
                  TableRow(children: [
                    const Text("Weight",
                        style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Text(widget.product_new.description ??"",
                        style: const TextStyle(
                            color: Palette.textColor, fontSize: 20)),
                  ]),
                ],
              ),
              Spacing(
                height: 40,
              ),
              SizedBox(
                  height: 50,
                  width: getWidth(context),
                  child: ElevatedButton(
                    child: const Text("Add to Cart",
                        style: TextStyle(color: Palette.white, fontSize: 20.0)),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Palette.primaryColor,
                      onPrimary: Palette.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    onPressed: ()
                    {

                      print(widget.product_new.toJson());
                      context.read<CartBloc>().add(AddProduct(widget.product_new));

                    },
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
