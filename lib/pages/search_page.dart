
import 'package:flutter/material.dart';
import 'package:flutter_bloc_trial/models/book_model.dart';
import 'package:flutter_bloc_trial/pages/product_page.dart';

import '../models/product.dart';
import '../utils/palette.dart';

class ProductSearchDelegate extends SearchDelegate {
  ProductSearchDelegate({required this.models, required this.products});

  final List<String> models;
  final List<BookModel> products;
  // final List<ApiRes> products;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> allResults = models
        .where((model) => model.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: allResults.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(allResults[index]),
              onTap: () {
                // ApiRes product = ApiRes();

                BookModel product = BookModel();
                for (BookModel element in products) {
                  if (element == allResults[index]) {
                    product = element;
                  }
                }
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductPage(
                          pageColor: index.floor().isEven
                              ? Palette.pageColor
                              : Palette.pageColor2,
                          product_new: product,
                        )));
              },
            ));
  }

  @override
  Widget buildSuggestions(BuildContext context)
  {
    List<String> suggestions = models
        .where((searchResult) =>
            searchResult.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              // ApiRes product = ApiRes();

              BookModel product = BookModel();
              for (BookModel element in products) {
                if (element == suggestion)
                {
                  product = element;
                }
              }
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductPage(
                        pageColor: index.floor().isEven
                            ? Palette.pageColor
                            : Palette.pageColor2,
                        product_new: product,
                      )));
            },
          );
        });
  }
}
