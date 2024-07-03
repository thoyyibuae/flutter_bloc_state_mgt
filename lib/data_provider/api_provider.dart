import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/ResponseModel.dart';
import '../models/book_model.dart';
import '../models/product.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://run.mocky.io/v3/919a0d45-c054-4452-8175-65538e554272';

  // final url ="https://jsonplaceholder.typicode.com/posts";


  final url_new ="http://192.168.1.15:4001/api/book/books";

  final url ="https://jsonplaceholder.typicode.com/photos";

  // Future<ResponseModel> fetchProductList() async
  // {
  //   try {
  //     Response response = await _dio.get(url);
  //     return ResponseModel.fromJson(response.data);
  //
  //   } catch (error, stacktrace) {
  //     // ignore: avoid_print
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return ResponseModel.withError("Data not found / Connection issue");
  //
  //   }
  // }


  Future<dynamic> fetchProductList_new() async
  {
    try {
      var response = await http.get(Uri.parse(url_new));
      print(" 40 the api res is : ${response.body}");
      return response.body;
      // return ResponseModel.fromJson(response.body);

    } catch (error, stacktrace) {
      // ignore: avoid_print
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseModel.withError("Data not found / Connection issue");

    }
  }
  List<ApiRes> userList =[];

  List<BookModel> userList_new =[];

  Future<ResModel> fetchData_new() async {
    try {

      userList_new=[];

      var response = await http.get(Uri.parse(url_new));
      print(response.body.runtimeType);
      print(response.body);
      var rs =json.decode(response.body);
      List<dynamic> dt = [];

      dt=rs;

      // var js = (json.decode(response.data));

      List<dynamic> dlst = [];


      // List<Users>.from(json.decode(response.body).map((x) => Users.fromJson(x)));
      // List<ApiRes>.from(dt.map((model)=> ApiRes.fromJson(model)));;
      // List<ApiRes>.from(dt.map((x) => ApiRes.fromJson(x)))
      //     .forEach((element)
      // {
      //
      //   // print(element.title);
      //   // print("The user id 37");
      //
      // });
      print("the given list is : ${dt.runtimeType}");

      userList_new =   List<BookModel>.from(dt.map((x) => BookModel.fromJson(x)));
      // Map<String, dynamic> categoryTypes = dt;

      // categories = ResModel.fromJson(categoryTypes);


      // dt.forEach((element) {
      //   print(element);
      // });



      print("the given list is :");
      ResModel md=
      ResModel(
          status: true,
          datas:userList_new

      );
      print(" line 31 The md is : ${md}");

      // print(ResModel.fromJson(md).status);


      return md;

    } catch (error, stacktrace) {
      // ignore: avoid_print
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResModel.withError("Data not found / Connection issue");
    }
  }

  // Future<ResModel> fetchData() async {
  //   try {
  //
  //     userList=[];
  //
  //     Response response = await _dio.get(url);
  //     print(response.data.runtimeType);
  //     var rs =response.data;
  //     List<dynamic> dt = [];
  //
  //     dt=rs;
  //
  //     // var js = (json.decode(response.data));
  //
  //     List<dynamic> dlst = [];
  //
  //
  //     // List<Users>.from(json.decode(response.body).map((x) => Users.fromJson(x)));
  //     // List<ApiRes>.from(dt.map((model)=> ApiRes.fromJson(model)));;
  //     // List<ApiRes>.from(dt.map((x) => ApiRes.fromJson(x)))
  //     //     .forEach((element)
  //     // {
  //     //
  //     //   // print(element.title);
  //     //   // print("The user id 37");
  //     //
  //     // });
  //       print("the given list is : ${dt.runtimeType}");
  //
  //       userList =   List<ApiRes>.from(dt.map((x) => ApiRes.fromJson(x)));
  //     // Map<String, dynamic> categoryTypes = dt;
  //
  //     // categories = ResModel.fromJson(categoryTypes);
  //
  //
  //     // dt.forEach((element) {
  //     //   print(element);
  //     // });
  //
  //
  //
  //     print("the given list is :");
  //     ResModel md=
  //       ResModel(
  //         status: true,
  //         datas:userList
  //
  //       );
  //     print(" line 31 The md is : ${md}");
  //
  //     // print(ResModel.fromJson(md).status);
  //
  //
  //     return md;
  //
  //   } catch (error, stacktrace) {
  //     // ignore: avoid_print
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return ResModel.withError("Data not found / Connection issue");
  //   }
  // }

}
