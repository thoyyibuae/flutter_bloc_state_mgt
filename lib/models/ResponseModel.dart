import 'package:flutter_bloc_trial/models/book_model.dart';
import 'package:flutter_bloc_trial/models/product.dart';

class ResponseModel {
  bool? status;
  List<Product>? products;
  String? error;

  ResponseModel({this.status, this.products});

  ResponseModel.withError(String errorMessage)
  {
    error = errorMessage;
  }


  ResponseModel.fromJson(Map<String, dynamic> json)

  {

    status = json['status'];
    if (json['result'] != null) {
      products = [];
      json['result'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
  }


}



class ResModel {
  bool? status;
  List<BookModel> ? datas;
  // List<ApiRes>? datas;
  String? error;

  ResModel({this.status, this.datas});

  ResModel.withError(String errorMessage) {
    error = errorMessage;
  }


  ResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      datas = [];
      json['result'].forEach((v) {
        datas!.add(BookModel.fromJson(v));
      });
    }
  }



    Map<String, dynamic> toJson()
    {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['status'] = status;
      data['datas'] = datas;

      return data;
    }

  }


