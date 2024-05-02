import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/controller/get_product_controller.dart';
import 'package:prodsubecom/controller/product_details_controller.dart';
import 'package:prodsubecom/controller/search_controller.dart';
import 'package:prodsubecom/model/product_details_model.dart';
import 'package:prodsubecom/model/search_product_model.dart';
import 'package:prodsubecom/repository/api_url.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/global_var.dart';
import 'package:prodsubecom/repository/widgets.dart';
import 'package:prodsubecom/view/product_details_page.dart';
import 'package:prodsubecom/view/sub_brand_tabs.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  GetProductController getProductController = Get.put(GetProductController());
  // MySearchController mySearchController = Get.put(MySearchController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductController.GetProductApiMethod();
    // mySearchController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        switch (getProductController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            return Text("Network error");

          case Status.COMPLETED:
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            // controller: mySearchController.textController.value,
                            // onChanged: (value) =>
                            //     mySearchController.search(value),
                            decoration: InputDecoration(
                              labelText: 'Search',
                              hintText: 'Enter product name',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: getProductController
                          .getProductList.value.data!.products!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.68,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.to(productDetailsBuilder());
                                productId = getProductController.getProductList
                                    .value.data!.products![index].id;
                                produdtVarId = getProductController
                                    .getProductList
                                    .value
                                    .data!
                                    .products![index]
                                    .productVariantId;
                              },
                              child: DottedBorder(
                                strokeWidth: 0.1,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                borderType: BorderType.Rect,
                                radius: Radius.circular(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (AppUrl.imageBaseUrl +
                                            getProductController
                                                .getProductList
                                                .value
                                                .data!
                                                .products![index]
                                                .singleImage !=
                                        null)
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 250, 251, 255),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 0.8,
                                              blurRadius: 0.55,
                                              offset: Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            AppUrl.imageBaseUrl +
                                                getProductController
                                                    .getProductList
                                                    .value
                                                    .data!
                                                    .products![index]
                                                    .singleImage,
                                            // height: 64,
                                          ),
                                        ),
                                      ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: starIcon(),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10),
                                        child: Text(
                                          getProductController
                                              .getProductList
                                              .value
                                              .data!
                                              .products![index]
                                              .title,
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
                                                      .getProductList
                                                      .value
                                                      .data!
                                                      .products![index]
                                                      .sellingPrice,
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            if (getProductController
                                                    .getProductList
                                                    .value
                                                    .data!
                                                    .products![index]
                                                    .sellingPrice !=
                                                getProductController
                                                    .getProductList
                                                    .value
                                                    .data!
                                                    .products![index]
                                                    .price)
                                              Text(
                                                "₹ " +
                                                    getProductController
                                                        .getProductList
                                                        .value
                                                        .data!
                                                        .products![index]
                                                        .price,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              ),
                                            if (getProductController
                                                    .getProductList
                                                    .value
                                                    .data!
                                                    .products![index]
                                                    .discount !=
                                                "0")
                                              Text(
                                                getProductController
                                                        .getProductList
                                                        .value
                                                        .data!
                                                        .products![index]
                                                        .discount +
                                                    "%",
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 130,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ]);
                      }),
                ),
              ],
            );
        }
      })),
    );
  }

  Widget productDetailsBuilder() {
    return ProductDetailsPage();
  }
}
