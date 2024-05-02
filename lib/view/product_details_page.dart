import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/controller/product_details_controller.dart';
import 'package:prodsubecom/repository/api_url.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productDetailsController.GetProductDetailsApiMethod();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
              IconButton(onPressed: () {}, icon: Icon(Icons.card_travel))
            ],
          ),
          backgroundColor: Color.fromARGB(255, 255, 253, 253),
          bottomSheet: Row(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                    child: Text(
                  "Add To Cart",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(color: Colors.amber),
                child: Center(
                    child: Text(
                  "Buy Now",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              )
            ],
          ),
          body: Obx(() {
            switch (productDetailsController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return Text("Network error");

              case Status.COMPLETED:
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 251, 255),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0.8,
                                blurRadius: 0.55,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Image.network(AppUrl.imageBaseUrl +
                              productDetailsController.getProductDetailsList
                                  .value.data!.productData!.singleImage),
                        ),
                        Positioned(
                          right: 10,
                          top: 50,
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color.fromARGB(255, 209, 190, 190),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.white,
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color.fromARGB(255, 209, 190, 190),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              starIcon(),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "0 Rating",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Text(
                            "InStock",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        productDetailsController.getProductDetailsList.value
                            .data!.productData!.title,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "₹ " +
                                    productDetailsController
                                        .getProductDetailsList
                                        .value
                                        .data!
                                        .productData!
                                        .sellingPrice,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              if (productDetailsController.getProductDetailsList
                                      .value.data!.productData!.sellingPrice !=
                                  productDetailsController.getProductDetailsList
                                      .value.data!.productData!.price)
                                Text(
                                  "₹ " +
                                      productDetailsController
                                          .getProductDetailsList
                                          .value
                                          .data!
                                          .productData!
                                          .price,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                          if (productDetailsController.getProductDetailsList
                                  .value.data!.productData!.discount !=
                              "0")
                            Text(
                              productDetailsController.getProductDetailsList
                                      .value.data!.productData!.discount +
                                  "%  Off",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Find a seller to deliver to you !"),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text("Enter PinCode"),
                          )
                        ],
                      )
                    ],
                  ),
                );
            }
          })),
    );
  }
}
