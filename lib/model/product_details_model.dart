// To parse this JSON data, do
//
//     final productDetailsModel = productDetailsModelFromJson(jsonString);

import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  var code;
  var message;
  Data? data;

  ProductDetailsModel({
    this.code,
    this.message,
    this.data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  var mainSellingPrice;
  var frequestSellingPrice;
  var totalPrice;
  ProductData? productData;
  List<RelatedProduct>? relatedProducts;
  List<dynamic>? frequentProductsList;
  List<dynamic>? productsReview;
  var qrcode;
  var ratingData;
  var reviewData;
  var ratingAvg;
  var rating5;
  var rating4;
  var rating3;
  var rating2;
  var rating1;
  List<dynamic>? recentViewProducts;

  Data({
    this.mainSellingPrice,
    this.frequestSellingPrice,
    this.totalPrice,
    this.productData,
    this.relatedProducts,
    this.frequentProductsList,
    this.productsReview,
    this.qrcode,
    this.ratingData,
    this.reviewData,
    this.ratingAvg,
    this.rating5,
    this.rating4,
    this.rating3,
    this.rating2,
    this.rating1,
    this.recentViewProducts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        mainSellingPrice: json["main_selling_price"],
        frequestSellingPrice: json["frequest_selling_price"],
        totalPrice: json["total_price"],
        productData: ProductData.fromJson(json["product_data"]),
        relatedProducts: List<RelatedProduct>.from(
            json["related_products"].map((x) => RelatedProduct.fromJson(x))),
        frequentProductsList:
            List<dynamic>.from(json["frequentProductsList"].map((x) => x)),
        productsReview:
            List<dynamic>.from(json["productsReview"].map((x) => x)),
        qrcode: json["qrcode"],
        ratingData: json["rating_data"],
        reviewData: json["review_data"],
        ratingAvg: json["rating_avg"],
        rating5: json["rating_5"],
        rating4: json["rating_4"],
        rating3: json["rating_3"],
        rating2: json["rating_2"],
        rating1: json["rating_1"],
        recentViewProducts:
            List<dynamic>.from(json["recentViewProducts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "main_selling_price": mainSellingPrice,
        "frequest_selling_price": frequestSellingPrice,
        "total_price": totalPrice,
        "product_data": productData!.toJson(),
        "related_products":
            List<dynamic>.from(relatedProducts!.map((x) => x.toJson())),
        "frequentProductsList":
            List<dynamic>.from(frequentProductsList!.map((x) => x)),
        "productsReview": List<dynamic>.from(productsReview!.map((x) => x)),
        "qrcode": qrcode,
        "rating_data": ratingData,
        "review_data": reviewData,
        "rating_avg": ratingAvg,
        "rating_5": rating5,
        "rating_4": rating4,
        "rating_3": rating3,
        "rating_2": rating2,
        "rating_1": rating1,
        "recentViewProducts":
            List<dynamic>.from(recentViewProducts!.map((x) => x)),
      };
}

class ProductData {
  var id;
  var title;
  var categoryId;
  var categoryName;
  var subCategoryId;
  var subcategoryName;
  var brandId;
  BrandName? brandName;
  var sku;
  var description;
  var specification;
  var shortDescription;
  var exchangeDays;
  var returnDays;
  var sizeChartImage;
  var paymentOption;
  var creditPoints;
  var isCommissionAdded;
  var commissionPercent;
  var productVariantId;
  var variantId;
  var subVariantId;
  var defaultSize;
  var quantity;
  var price;
  var sellingPrice;
  var discount;
  var mainDiscount;
  var offerDiscount;
  var offerName;
  VariantDetail? variantDetail;
  List<OtherVariantArray>? otherVariantArray;
  var singleImage;
  List<dynamic>? productOutlets;
  var wishlistExist;
  var cartExist;

  ProductData({
    this.id,
    this.title,
    this.categoryId,
    this.categoryName,
    this.subCategoryId,
    this.subcategoryName,
    this.brandId,
    this.brandName,
    this.sku,
    this.description,
    this.specification,
    this.shortDescription,
    this.exchangeDays,
    this.returnDays,
    this.sizeChartImage,
    this.paymentOption,
    this.creditPoints,
    this.isCommissionAdded,
    this.commissionPercent,
    this.productVariantId,
    this.variantId,
    this.subVariantId,
    this.defaultSize,
    this.quantity,
    this.price,
    this.sellingPrice,
    this.discount,
    this.mainDiscount,
    this.offerDiscount,
    this.offerName,
    this.variantDetail,
    this.otherVariantArray,
    this.singleImage,
    this.productOutlets,
    this.wishlistExist,
    this.cartExist,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        subCategoryId: json["sub_category_id"],
        subcategoryName: json["subcategory_name"],
        brandId: json["brand_id"],
        // brandName: brandNameValues.map[json["brand_name"]]!,
        sku: json["SKU"],
        description: json["description"],
        specification: json["specification"],
        shortDescription: json["short_description"],
        exchangeDays: json["exchange_days"],
        returnDays: json["return_days"],
        sizeChartImage: json["size_chart_image"],
        paymentOption: json["payment_option"],
        creditPoints: json["credit_points"],
        isCommissionAdded: json["is_commission_added"],
        commissionPercent: json["commission_percent"],
        productVariantId: json["product_variant_id"],
        variantId: json["variant_id"],
        subVariantId: json["sub_variant_id"],
        defaultSize: json["default_size"],
        quantity: json["quantity"],
        price: json["price"],
        sellingPrice: json["selling_price"],
        discount: json["discount"],
        mainDiscount: json["main_discount"],
        offerDiscount: json["offer_discount"],
        offerName: json["offer_name"],
        variantDetail: VariantDetail.fromJson(json["variant_detail"]),
        otherVariantArray: List<OtherVariantArray>.from(
            json["other_variant_array"]
                .map((x) => OtherVariantArray.fromJson(x))),
        singleImage: json["single_image"],
        productOutlets:
            List<dynamic>.from(json["product_outlets"].map((x) => x)),
        wishlistExist: json["wishlistExist"],
        cartExist: json["cartExist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category_id": categoryId,
        "category_name": categoryName,
        "sub_category_id": subCategoryId,
        "subcategory_name": subcategoryName,
        "brand_id": brandId,
        "brand_name": brandNameValues.reverse[brandName],
        "SKU": sku,
        "description": description,
        "specification": specification,
        "short_description": shortDescription,
        "exchange_days": exchangeDays,
        "return_days": returnDays,
        "size_chart_image": sizeChartImage,
        "payment_option": paymentOption,
        "credit_points": creditPoints,
        "is_commission_added": isCommissionAdded,
        "commission_percent": commissionPercent,
        "product_variant_id": productVariantId,
        "variant_id": variantId,
        "sub_variant_id": subVariantId,
        "default_size": defaultSize,
        "quantity": quantity,
        "price": price,
        "selling_price": sellingPrice,
        "discount": discount,
        "main_discount": mainDiscount,
        "offer_discount": offerDiscount,
        "offer_name": offerName,
        "variant_detail": variantDetail!.toJson(),
        "other_variant_array":
            List<dynamic>.from(otherVariantArray!.map((x) => x.toJson())),
        "single_image": singleImage,
        "product_outlets": List<dynamic>.from(productOutlets!.map((x) => x)),
        "wishlistExist": wishlistExist,
        "cartExist": cartExist,
      };
}

enum BrandName { SG, SM }

final brandNameValues = EnumValues({"SG": BrandName.SG, "SM": BrandName.SM});

class OtherVariantArray {
  var id;
  OtherVariantArrayName? name;
  var type;
  List<ProductVariant>? productVariant;

  OtherVariantArray({
    this.id,
    this.name,
    this.type,
    this.productVariant,
  });

  factory OtherVariantArray.fromJson(Map<String, dynamic> json) =>
      OtherVariantArray(
        id: json["id"],
        name: otherVariantArrayNameValues.map[json["name"]]!,
        type: json["type"],
        productVariant: List<ProductVariant>.from(
            json["product_variant"].map((x) => ProductVariant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": otherVariantArrayNameValues.reverse[name],
        "type": type,
        "product_variant":
            List<dynamic>.from(productVariant!.map((x) => x.toJson())),
      };
}

enum OtherVariantArrayName { COLOR, SIZE }

final otherVariantArrayNameValues = EnumValues(
    {"Color": OtherVariantArrayName.COLOR, "Size": OtherVariantArrayName.SIZE});

class ProductVariant {
  var productId;
  var productVariantId;
  List<ProductVariantImage>? productVariantImage;
  var name;
  var code;
  List<SubVariantDetail>? assignSizes;

  ProductVariant({
    this.productId,
    this.productVariantId,
    this.productVariantImage,
    this.name,
    this.code,
    this.assignSizes,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) => ProductVariant(
        productId: json["product_id"],
        productVariantId: json["product_variant_id"],
        productVariantImage: List<ProductVariantImage>.from(
            json["product_variant_image"]
                .map((x) => ProductVariantImage.fromJson(x))),
        name: json["name"],
        code: json["code"],
        // assignSizes: List<SubVariantDetail>.from(
        //     json["assign_sizes"].map((x) => SubVariantDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_variant_id": productVariantId,
        "product_variant_image":
            List<dynamic>.from(productVariantImage!.map((x) => x.toJson())),
        "name": name,
        "code": code,
        "assign_sizes": List<dynamic>.from(assignSizes!.map((x) => x.toJson())),
      };
}

class SubVariantDetail {
  var id;
  var variantId;
  SubVariantDetailName? name;
  var sequenceNo;
  var code;
  var status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubVariantDetail({
    this.id,
    this.variantId,
    this.name,
    this.sequenceNo,
    this.code,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory SubVariantDetail.fromJson(Map<String, dynamic> json) =>
      SubVariantDetail(
        id: json["id"],
        variantId: json["variant_id"],
        // name: subVariantDetailNameValues.map[json["name"]]!,
        sequenceNo: json["sequence_no"],
        code: json["code"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "variant_id": variantId,
        "name": subVariantDetailNameValues.reverse[name],
        "sequence_no": sequenceNo,
        "code": code,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

enum SubVariantDetailName { M, S, XXL }

final subVariantDetailNameValues = EnumValues({
  "M": SubVariantDetailName.M,
  "S": SubVariantDetailName.S,
  "XXL": SubVariantDetailName.XXL
});

class ProductVariantImage {
  var id;
  var productId;
  var productVariantId;
  var image;
  var status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductVariantImage({
    this.id,
    this.productId,
    this.productVariantId,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductVariantImage.fromJson(Map<String, dynamic> json) =>
      ProductVariantImage(
        id: json["id"],
        productId: json["product_id"],
        productVariantId: json["product_variant_id"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_variant_id": productVariantId,
        "image": image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class VariantDetail {
  var id;
  OtherVariantArrayName? name;
  var status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  var type;

  VariantDetail({
    this.id,
    this.name,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  factory VariantDetail.fromJson(Map<String, dynamic> json) => VariantDetail(
        id: json["id"],
        name: otherVariantArrayNameValues.map[json["name"]]!,
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": otherVariantArrayNameValues.reverse[name],
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "type": type,
      };
}

class RelatedProduct {
  var id;
  var title;
  var categoryId;
  var subCategoryId;
  var brandId;
  BrandName? brandName;
  var productVariantId;
  var price;
  var sellingPrice;
  var discount;
  VariantDetail? variantDetail;
  SubVariantDetail? subVariantDetail;
  var singleImage;
  var ratingAverage;
  var ratingCount;
  List<dynamic>? productOutlets;
  var wishlistExist;

  RelatedProduct({
    this.id,
    this.title,
    this.categoryId,
    this.subCategoryId,
    this.brandId,
    this.brandName,
    this.productVariantId,
    this.price,
    this.sellingPrice,
    this.discount,
    this.variantDetail,
    this.subVariantDetail,
    this.singleImage,
    this.ratingAverage,
    this.ratingCount,
    this.productOutlets,
    this.wishlistExist,
  });

  factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        brandId: json["brand_id"],
        // brandName: brandNameValues.map[json["brand_name"]]!,
        productVariantId: json["product_variant_id"],
        price: json["price"],
        sellingPrice: json["selling_price"],
        discount: json["discount"],
        variantDetail: VariantDetail.fromJson(json["variant_detail"]),
        subVariantDetail: SubVariantDetail.fromJson(json["sub_variant_detail"]),
        singleImage: json["single_image"],
        ratingAverage: json["rating_average"],
        ratingCount: json["rating_count"],
        productOutlets:
            List<dynamic>.from(json["product_outlets"].map((x) => x)),
        wishlistExist: json["wishlistExist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "brand_id": brandId,
        "brand_name": brandNameValues.reverse[brandName],
        "product_variant_id": productVariantId,
        "price": price,
        "selling_price": sellingPrice,
        "discount": discount,
        "variant_detail": variantDetail!.toJson(),
        "sub_variant_detail": subVariantDetail!.toJson(),
        "single_image": singleImage,
        "rating_average": ratingAverage,
        "rating_count": ratingCount,
        "product_outlets": List<dynamic>.from(productOutlets!.map((x) => x)),
        "wishlistExist": wishlistExist,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
