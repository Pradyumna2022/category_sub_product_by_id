import 'package:get/get.dart';
import 'package:prodsubecom/model/sub_category_model.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/repos.dart';
import 'package:prodsubecom/view/all_product_screen.dart';

class SubAndBrandController extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final subcatAndBrandList = SubCategoryModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setSubAndCatBrandList(SubCategoryModel _value) =>
      subcatAndBrandList.value = _value;
  void setError(String _value) => error.value = _value;
  Map Data = {"category_id": '1'};

  void SubCatAndBrandApi() {
    //  setRxRequestStatus(Status.LOADING);

    _api.fetchSubCategApi(Data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setSubAndCatBrandList(value);
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
