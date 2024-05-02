import 'package:prodsubecom/model/get_product_model.dart';
import 'package:prodsubecom/model/product_details_model.dart';
import 'package:prodsubecom/repository/api_url.dart';
import 'package:prodsubecom/model/sub_category_model.dart';
import 'package:prodsubecom/repository/error_repos.dart';

class AuthRepository {
  int? abcd;
  final _apiService = NetworkApiServices();

  // ********************** fetchSubCateApi *************************
  Future<SubCategoryModel> fetchSubCategApi(var data) async {
    print("hited");
    dynamic response = await _apiService.postApi(data, AppUrl.subCateBrandUrl);
    print('------------------------------');
    print(response);
    print('------------------------------');
    return SubCategoryModel.fromJson(response);
  }

  // ********************** Product of api *************************
  Future<GetProductModel> getProductApi(var data) async {
    print("hited");
    dynamic response = await _apiService.postApi(data, AppUrl.getProductUrl);
    print('------------------------------');
    print(response);
    print('------------------------------');
    return GetProductModel.fromJson(response);
  }

  // ********************** Product Details of api *************************
  Future<ProductDetailsModel> productDetailsApi(var data) async {
    print("hited");
    dynamic response =
        await _apiService.postApi(data, AppUrl.getProductDetailsUrl);
    print('------------------------------');
    print(response);
    print('------------------------------');
    return ProductDetailsModel.fromJson(response);
  }
}
