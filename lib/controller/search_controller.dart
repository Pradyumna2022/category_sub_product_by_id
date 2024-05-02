// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:prodsubecom/model/search_product_model.dart';

// class MySearchController extends GetxController {
//   var productList = SearchProductModel().obs;
//   var filteredList = SearchProductModel().obs;
//   var isLoading = true.obs;
//   final textController = TextEditingController().obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProducts();
//   }

//   void fetchProducts() async {
//     try {
//       isLoading(true);
//       final response = await http.post(
//           Uri.parse(
//               'https://alobhaitsolution.com/letzplay_dev/public/api/customer/get-product'),
//           body: jsonEncode({'header_search': textController.value.toString()}),
//           headers: ({'Content-type': 'application/json'}));
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = json.decode(response.body);
//         final SearchProductModel searchProductModel =
//             SearchProductModel.fromJson(responseData);
//         productList.value = searchProductModel;
//         filteredList.value = searchProductModel; // Initialize filteredList
//       } else {
//         throw Exception('Failed to load products');
//       }
//     } catch (e) {
//       print('Error: $e');
//     } finally {
//       isLoading(false);
//     }
//   }

//   void search(String query) {
//     if (query.isEmpty) {
//       filteredList.value = productList.value;
//     } else {
//       final String searchTerm = query.toLowerCase();
//       filteredList.value = SearchProductModel(
//         data: Data(
//           products: productList.value.data!.products!
//               .where(
//                 (product) => product.name.toLowerCase().contains(searchTerm),
//               )
//               .toList(),
//           category: productList.value.data!.category,
//           brands: productList.value.data!.brands,
//           variants: productList.value.data!.variants,
//           subCategories: productList.value.data!.subCategories,
//           maxSellingPrice: productList.value.data!.maxSellingPrice,
//           minSellingPrice: productList.value.data!.minSellingPrice,
//           categoryDetail: productList.value.data!.categoryDetail,
//           subCategoryDetail: productList.value.data!.subCategoryDetail,
//           brandBanner: productList.value.data!.brandBanner,
//           pagination: productList.value.data!.pagination,
//         ),
//       );
//     }
//   }
// }
