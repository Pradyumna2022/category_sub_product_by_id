import 'package:prodsubecom/model/product_model.dart';
import 'package:prodsubecom/repository/api_url.dart';
import 'package:prodsubecom/repository/error_repos.dart';

class AuthRepository {
  int? abcd;
  final _apiService = NetworkApiServices();

  // ********************** fetchProduct *************************
  Future<ProductModel> fetchProductApi() async {
    print("hited");
    dynamic response =
        await _apiService.getApi2('https://dummyjson.com/products');
    print('------------------------------');
    print(response);
    print('------------------------------');
    return ProductModel.fromJson(response);
  }
}
