import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/controller/sub_category_controller.dart';
import 'package:prodsubecom/repository/api_url.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/view/all_product_screen.dart';

class SubCategoryAndBrandScreen extends StatefulWidget {
  const SubCategoryAndBrandScreen({super.key});

  @override
  State<SubCategoryAndBrandScreen> createState() =>
      _SubCategoryAndBrandScreenState();
}

class _SubCategoryAndBrandScreenState extends State<SubCategoryAndBrandScreen> {
  final subandcatbrandIntance = Get.put(SubAndBrandController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subandcatbrandIntance.SubCatAndBrandApi();
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(body: Obx(() {
      switch (subandcatbrandIntance.rxRequestStatus.value) {
        case Status.LOADING:
          return const Center(child: CircularProgressIndicator());
        case Status.ERROR:
          return Text("Network error");

        case Status.COMPLETED:
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount:
                  subandcatbrandIntance.subcatAndBrandList.value.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('object----------------------first or $index');
                    Get.to(AllProductsScreen());
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.8,
                          blurRadius: 0.55,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          subandcatbrandIntance
                              .subcatAndBrandList.value.data![index].name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Image.network(
                          AppUrl.imageBaseUrl +
                              subandcatbrandIntance
                                  .subcatAndBrandList.value.data![index].image,
                          width: 40,
                        )
                      ],
                    ),
                  ),
                );
              });
      }
    }));
  }
}
