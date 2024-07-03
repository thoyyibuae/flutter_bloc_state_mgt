
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_trial/pages/product_page.dart';
import 'package:flutter_bloc_trial/pages/search_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';

import '../bloc/product_bloc.dart';
import '../models/ResponseModel.dart';
import '../models/book_model.dart';
// import '../models/product.dart';
import '../utils/palette.dart';
import '../utils/spacing.dart';
import 'category_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> models = [];
  // List<ApiRes> products = [];


  List<String> models = [];
  List<BookModel> products_new = [];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing(
                height: getHeight(context) * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "BLISS",
                    style: TextStyle(
                        color: Palette.primaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVfzBpLI1IKuUbNnqhQZh8q3bHAN2BKaMKBaZSz988iANoIXi_AWEjS0-4tKtLyF0Vw5A&usqp=CAU",
                          fit: BoxFit.fill,
                        ),
                      ),
                      decoration: const BoxDecoration(
                          color: Palette.pageColor, shape: BoxShape.circle))
                ],
              ),
              Spacing(
                height: 10,
              ),
              const Text(
                "Hello,",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Palette.textColorLight,
                  fontSize: 20,
                ),
              ),
              Spacing(
                height: 20,
              ),
              const Text(
                "Sudesh Kumara",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Spacing(
                height: 30,
              ),
              _buildSearchBox(),
              Spacing(
                height: 30,
              ),
              const Text(
                "By Category",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Spacing(
                height: 20,
              ),
              _buildCategories(),
              Spacing(
                height: 20,
              ),
              const Text(
                "All Products",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Spacing(
                height: 10,
              ),
              _buildListProduct()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        models.clear();
        products_new.clear();
        if (state is ProductLoaded) {
          for (BookModel product in state.responseModel.datas!) {
            models.add(product.name.toString());
            products_new.add(product);
          }
        }
        return GestureDetector(
          onTap: () {
            showSearch(
                context: context,
                delegate:
                    ProductSearchDelegate(models: models, products: products_new));
          },
          child: Container(
            height: 60.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
                border: Border.all(color: Palette.black.withOpacity(0.3)),
                color: Palette.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Search Your Model",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Palette.textColorLight,
                    fontSize: 15,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Palette.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    const Icon(
                      Icons.search,
                      color: Palette.white,
                      size: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  List<BookModel> filterByCategory(String category,
      List<BookModel> products
      ) {
    List<BookModel> filtered = [];

    for (BookModel product in products) {
      if (product.name!.contains(category)) {
        filtered.add(product);
      }
    }

    return filtered;
  }

  Widget _buildCategories() {

    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        // List<ApiRes> products = [];
        List<BookModel> products_new = [];
        if (state is ProductLoaded) {
          products_new = state.responseModel.datas!;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryPage(
                          products_new: filterByCategory("guitar", products_new),
                          categoryName: "Guitar",
                        )));
              },
              child: Container(
                height: 60.0,
                width: 100.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: Palette.pink,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/guitar.svg",
                      height: 25.0,
                      color: Palette.white,
                    ),
                    const Text(
                      "Guitar",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Palette.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryPage(
                          products_new: filterByCategory("piano", products_new),
                          categoryName: "Piano",
                        )));
              },
              child: Container(
                height: 60.0,
                width: 100.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: Palette.yellow,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/piano.svg",
                      height: 25.0,
                      color: Palette.white,
                    ),
                    const Text(
                      "Piano",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Palette.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryPage(
                          products_new: filterByCategory("drums", products_new),
                          categoryName: "Drum",
                        )));
              },
              child: Container(
                height: 60.0,
                width: 100.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: Palette.green,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/drum.svg",
                      height: 25.0,
                      color: Palette.white,
                    ),
                    const Text(
                      "Drum",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Palette.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildListProduct() {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
            ),
          );
        }
      },
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            return _buildLoading();
          }
          if (state is ProductLoading) {
            return _buildLoading();
          }
          if (state is ProductLoaded) {
            return _buildCard(context, state.responseModel);
          }
          if (state is ProductError) {
            return Container(
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Spacer(),
                  Text("Error Occured!"),
                  // Spacer(),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, ResModel model) {

    // print("The given dt is :${model.toJson()}");
    // model ==null  ?
    //  return   Container()
    // :
   return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.0,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: model.datas!.length,
      itemBuilder: (context, index) {

        return GestureDetector(
          onTap: () {

            BookModel bk = BookModel(
              authorName: "auth" ,
              description: "hi",
              isbn: "new",
              iV: 1,
              name:"new name" ,
              sId: model.datas![index].sId,
              writtenYear: "2020"
            );

            context.read<ProductBloc>().add(UpdateProducts(bk));

            print(model.datas![index].name);
            print("The given list is :");
            // return;
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => ProductPage(
            //           pageColor: index.floor().isEven
            //               ? Palette.pageColor
            //               : Palette.pageColor2,
            //           product_new: model.datas![index],
            //         )));


          },
          child: Container(
            height: MediaQuery.of(context).size.height/3,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: index.floor().isEven
                    ? Palette.pageColor
                    : Palette.pageColor2,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: <Widget>[

              Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      LikeButton(
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? Palette.red : Palette.white,
                          );
                        },
                      )
                    ],
                  ),

                Row(
                  children: [

                    Expanded(
                      child:
                      Column(
                        children: [
                          Wrap(
                            children: [
                              Text(

                                model.datas![index].name.toString(),
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Palette.textColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Spacing(
                //   height: 10,
                // ),
           // Row(
           //   children: [
           //     Expanded(
           //       child: Container(
           //         height: 50,
           //         width: 50,
           //         child: Image.network(
           //
           //           model.datas![index].thumbnailUrl.toString(),
           //           width: 100.0, height: 100.0
           //           // style: const TextStyle(
           //           //     color: Palette.textColor,
           //           //     fontSize: 10,
           //           //     fontWeight: FontWeight.w500),
           //           // cacheHeight: 90,
           //
           //              ),
           //       ),
           //     ),
           //   ],
           // ),
           //      Spacing(
           //        height: 10,
           //      ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
