import '../data_provider/api_provider.dart';
import '../models/ResponseModel.dart';


class ApiRepository {
  final _provider = ApiProvider();

  // Future<ResponseModel> fetchProductList() {
  //   return _provider.fetchProductList();
  // }

  Future <ResModel> fetchApiList(){

    return _provider.fetchData_new();

  }

}

class NetworkError extends Error {}
