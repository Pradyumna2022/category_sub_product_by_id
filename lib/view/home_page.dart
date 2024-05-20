import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/controller/sub_category_controller.dart';
import 'package:prodsubecom/repository/api_url.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/global_var.dart';
import 'package:prodsubecom/repository/widgets.dart';
import 'package:prodsubecom/view/auth/login_page.dart';
import 'package:prodsubecom/view/product_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductController getProductController = Get.put(ProductController());
  void openCofirmatoin() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Do you want out ?'),
              content: Text("😓😓"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    FirebaseAuth.instance.signOut().then((value) {
                      Get.off(LoginPage(),
                          transition: Transition.rightToLeft,
                          duration: Duration(seconds: 1));
                    }).then((value) {
                      Get.snackbar('You are logged out', "Miss You",
                          backgroundColor: Colors.deepPurple,
                          colorText: Colors.white);
                    });
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductController.getProductDataMethod();
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final height = Get.height;
    print(height.toString() +
        '--------------------------heigh-------------------');
    print(width.toString() +
        '--------------------------width-------------------');
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Text(""),
            title: Text(
              "Products",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    openCofirmatoin();
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
          body: Obx(() {
            switch (getProductController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Text("Network error");

              case Status.COMPLETED:
                return GridView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: getProductController
                        .productDataList.value.products!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: height < 700 ? 1 / 1.34 : 0.645),
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2.0),
                          child: DottedBorder(
                            strokeWidth: 0.1,
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            borderType: BorderType.Rect,
                            radius: Radius.circular(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        ProductDetailsPage(
                                          image: getProductController
                                              .productDataList
                                              .value
                                              .products![index]
                                              .thumbnail,
                                          title: getProductController
                                              .productDataList
                                              .value
                                              .products![index]
                                              .title,
                                          description: getProductController
                                              .productDataList
                                              .value
                                              .products![index]
                                              .description,
                                          stock: getProductController
                                              .productDataList
                                              .value
                                              .products![index]
                                              .stock,
                                          price: getProductController
                                              .productDataList
                                              .value
                                              .products![index]
                                              .price,
                                          rating: getProductController
                                              .productDataList
                                              .value
                                              .products![index]
                                              .rating,
                                        ),
                                        transition: Transition.size);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height /
                                        4.5,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 250, 251, 255),
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 0.8,
                                          blurRadius: 0.55,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        getProductController.productDataList
                                            .value.products![index].thumbnail
                                            .toString(),
                                        fit: BoxFit.cover,
                                        // height: 64,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Row(
                                    children: [
                                      starIcon(),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        getProductController.productDataList
                                            .value.products![index].rating
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: Text(
                                      getProductController.productDataList.value
                                          .products![index].title
                                          .toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "₹ " +
                                              getProductController
                                                  .productDataList
                                                  .value
                                                  .products![index]
                                                  .price
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ]);
                    });
            }
          })),
    );
  }
}
