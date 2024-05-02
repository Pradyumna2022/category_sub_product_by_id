import 'package:get/get.dart';
import 'package:prodsubecom/controller/get_product_controller.dart';
import 'package:prodsubecom/model/get_product_model.dart';
import 'package:prodsubecom/model/product_details_model.dart';
import 'package:prodsubecom/model/sub_category_model.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/global_var.dart';
import 'package:prodsubecom/repository/repos.dart';
import 'package:prodsubecom/view/all_product_screen.dart';
import 'package:prodsubecom/view/product_details_page.dart';

class ProductDetailsController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final getProductDetailsList = ProductDetailsModel().obs;
  RxString error = ''.obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setGetProductDetailsList(ProductDetailsModel _value) =>
      getProductDetailsList.value = _value;
  void setError(String _value) => error.value = _value;

  Map Data = {"product_id": productId, "product_variant_id": produdtVarId};

  void GetProductDetailsApiMethod() {
    // setRxRequestStatus(Status.LOADING);

    _api.productDetailsApi(Data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setGetProductDetailsList(value);
      // print(value);
      print('done');
    }).onError((error, stackTrace) {
      setError(error.toString());
      print("error");
      setRxRequestStatus(Status.ERROR);
    });
  }

  // void refreshApi() {
  //   setRxRequestStatus(Status.LOADING);

  //   _api.FetchSubcriptionApi(Data).then((value) {
  //     setRxRequestStatus(Status.COMPLETED);
  //     setUserList(value);
  //   }).onError((error, stackTrace) {
  //     setError(error.toString());
  //     setRxRequestStatus(Status.ERROR);
  //   });
  // }
}
