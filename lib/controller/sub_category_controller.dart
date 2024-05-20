import 'package:get/get.dart';
import 'package:prodsubecom/model/product_model.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/repos.dart';

class ProductController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final productDataList = ProductModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void productDataGet(ProductModel _value) => productDataList.value = _value;
  void setError(String _value) => error.value = _value;

  void getProductDataMethod() {
    //  setRxRequestStatus(Status.LOADING);

    _api.fetchProductApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      productDataList(value);
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
