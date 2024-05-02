// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'dart:convert';

GetProductModel getProductModelFromJson(String str) =>
    GetProductModel.fromJson(json.decode(str));

String getProductModelToJson(GetProductModel data) =>
    json.encode(data.toJson());

class GetProductModel {
  var code;
  var message;
  Data? data;

  GetProductModel({
    this.code,
    this.message,
    this.data,
  });

  factory GetProductModel.fromJson(Map<String, dynamic> json) =>
      GetProductModel(
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
  List<Product>? products;
  var category;
  List<Brand>? brands;
  List<dynamic>? variants;
  List<SubCategory>? subCategories;
  var maxSellingPrice;
  var minSellingPrice;
  CategoryDetail? categoryDetail;
  SubCategory? subCategoryDetail;
  dynamic brandBanner;
  Pagination? pagination;

  Data({
    this.products,
    this.category,
    this.brands,
    this.variants,
    this.subCategories,
    this.maxSellingPrice,
    this.minSellingPrice,
    this.categoryDetail,
    this.subCategoryDetail,
    this.brandBanner,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        category: json["category"],
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        variants: List<dynamic>.from(json["variants"].map((x) => x)),
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
        maxSellingPrice: json["maxSellingPrice"],
        minSellingPrice: json["minSellingPrice"],
        categoryDetail: CategoryDetail.fromJson(json["category_detail"]),
        subCategoryDetail: SubCategory.fromJson(json["sub_category_detail"]),
        brandBanner: json["brandBanner"],
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "category": category,
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
        "variants": List<dynamic>.from(variants!.map((x) => x)),
        "subCategories":
            List<dynamic>.from(subCategories!.map((x) => x.toJson())),
        "maxSellingPrice": maxSellingPrice,
        "minSellingPrice": minSellingPrice,
        "category_detail": categoryDetail!.toJson(),
        "sub_category_detail": subCategoryDetail!.toJson(),
        "brandBanner": brandBanner,
        "pagination": pagination!.toJson(),
      };
}

class Brand {
  var id;
  var name;
  var slugName;
  var image;
  var brandPoster;
  var commissionPercent;
  var status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Brand({
    this.id,
    this.name,
    this.slugName,
    this.image,
    this.brandPoster,
    this.commissionPercent,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        slugName: json["slug_name"],
        image: json["image"],
        brandPoster: json["brand_poster"],
        commissionPercent: json["commission_percent"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug_name": slugName,
        "image": image,
        "brand_poster": brandPoster,
        "commission_percent": commissionPercent,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class CategoryDetail {
  var id;
  var name;
  var slugName;
  var commissionPercentNew;
  var commissionPercentOld;
  var image;
  var status;
  var sequence;
  var showBrand;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  var metaTitle;
  var metaDescription;
  var metaKeywords;

  CategoryDetail({
    required this.id,
    required this.name,
    required this.slugName,
    required this.commissionPercentNew,
    required this.commissionPercentOld,
    required this.image,
    required this.status,
    required this.sequence,
    required this.showBrand,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
        id: json["id"],
        name: json["name"],
        slugName: json["slug_name"],
        commissionPercentNew: json["commission_percent_new"],
        commissionPercentOld: json["commission_percent_old"],
        image: json["image"],
        status: json["status"],
        sequence: json["sequence"],
        showBrand: json["show_brand"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug_name": slugName,
        "commission_percent_new": commissionPercentNew,
        "commission_percent_old": commissionPercentOld,
        "image": image,
        "status": status,
        "sequence": sequence,
        "show_brand": showBrand,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
      };
}

class Pagination {
  int currentPage;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Pagination({
    required this.currentPage,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        currentPage: json["current_page"],
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Product {
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

  Product({
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

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        brandId: json["brand_id"],
        brandName: brandNameValues.map[json["brand_name"]]!,
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

enum BrandName { SS }

final brandNameValues = EnumValues({"SS": BrandName.SS});

class SubVariantDetail {
  var id;
  var variantId;
  var name;
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
        name: json["name"],
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
        "name": name,
        "sequence_no": sequenceNo,
        "code": code,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class VariantDetail {
  var id;
  Name? name;
  var status;
  dynamic? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  var type;

  VariantDetail({
    required this.id,
    required this.name,
    required this.status,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.type,
  });

  factory VariantDetail.fromJson(Map<String, dynamic> json) => VariantDetail(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "type": type,
      };
}

enum Name { SIZE }

final nameValues = EnumValues({"Size": Name.SIZE});

class SubCategory {
  var id;
  var name;
  var slugName;
  var categoryId;
  var image;
  var status;
  var upDiscount;
  var sequence;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubCategory({
    this.id,
    this.name,
    this.slugName,
    this.categoryId,
    this.image,
    this.status,
    this.upDiscount,
    this.sequence,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        name: json["name"],
        slugName: json["slug_name"],
        categoryId: json["category_id"],
        image: json["image"],
        status: json["status"],
        upDiscount: json["up_discount"],
        sequence: json["sequence"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug_name": slugName,
        "category_id": categoryId,
        "image": image,
        "status": status,
        "up_discount": upDiscount,
        "sequence": sequence,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
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
