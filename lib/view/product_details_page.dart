import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:prodsubecom/controller/sub_category_controller.dart';
import 'package:prodsubecom/repository/api_url.dart';
import 'package:prodsubecom/repository/enum.dart';
import 'package:prodsubecom/repository/widgets.dart';

class ProductDetailsPage extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final int stock;
  final int price;
  final double rating;
  const ProductDetailsPage(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.stock,
      required this.price,
      required this.rating});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductController productDetailsController = Get.put(ProductController());

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
            title: Text("Product Details Page"),
            centerTitle: true,
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
                              height: MediaQuery.of(context).size.height / 2.5,
                              width: double.maxFinite,
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
                              child: Image.network(
                                widget.image,
                                fit: BoxFit.cover,
                              ),
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
                                    "${widget.rating} Rating",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Text(
                                "${widget.stock} InStock",
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
                            widget.title,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.description,
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
                                    "₹ " + widget.price.toString(),
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Find a seller to deliver to you !"),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.blue, width: 1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text("Enter PinCode"),
                                  )
                                ],
                              )
                            ],
                          ),
                        ]));
            }
          })),
    );
  }
}
