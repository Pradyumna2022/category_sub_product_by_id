import 'package:get/get.dart';
import 'package:prodsubecom/model/get_product_model.dart';
import 'package:prodsubecom/model/sub_category_model.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/repos.dart';

class GetProductController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final getProductList = GetProductModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setGetProductList(GetProductModel _value) =>
      getProductList.value = _value;
  void setError(String _value) => error.value = _value;
  Map Data = {"main_category": '1', "subcategory": '1'};

  void GetProductApiMethod() {
    //  setRxRequestStatus(Status.LOADING);

    _api.getProductApi(Data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setGetProductList(value);
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
