// To parse this JSON data, do
//
//     final searchProductModel = searchProductModelFromJson(jsonString);

import 'dart:convert';

SearchProductModel searchProductModelFromJson(String str) =>
    SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) =>
    json.encode(data.toJson());

class SearchProductModel {
  var code;
  var message;
  Data? data;

  SearchProductModel({
    this.code,
    this.message,
    this.data,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) =>
      SearchProductModel(
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
  List<dynamic>? products;
  var category;
  List<Brand>? brands;
  List<dynamic>? variants;
  List<SubCategory>? subCategories;
  var maxSellingPrice;
  var minSellingPrice;
  dynamic categoryDetail;
  dynamic subCategoryDetail;
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
        products: List<dynamic>.from(json["products"].map((x) => x)),
        category: json["category"],
        brands: List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))),
        variants: List<dynamic>.from(json["variants"].map((x) => x)),
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
        maxSellingPrice: json["maxSellingPrice"],
        minSellingPrice: json["minSellingPrice"],
        categoryDetail: json["category_detail"],
        subCategoryDetail: json["sub_category_detail"],
        brandBanner: json["brandBanner"],
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x)),
        "category": category,
        "brands": List<dynamic>.from(brands!.map((x) => x.toJson())),
        "variants": List<dynamic>.from(variants!.map((x) => x)),
        "subCategories":
            List<dynamic>.from(subCategories!.map((x) => x.toJson())),
        "maxSellingPrice": maxSellingPrice,
        "minSellingPrice": minSellingPrice,
        "category_detail": categoryDetail,
        "sub_category_detail": subCategoryDetail,
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

class Pagination {
  var currentPage;
  var firstPageUrl;
  dynamic from;
  var lastPage;
  var lastPageUrl;
  dynamic nextPageUrl;
  var path;
  var perPage;
  dynamic prevPageUrl;
  dynamic to;
  var total;

  Pagination({
    this.currentPage,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
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

class SubCategory {
  var id;
  var name;
  var slugName;
  var categoryId;
  var image;
  var status;
  UpDiscount? upDiscount;
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
        upDiscount: upDiscountValues.map[json["up_discount"]]!,
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
        "up_discount": upDiscountValues.reverse[upDiscount],
        "sequence": sequence,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

enum UpDiscount { UP_TO_40, UP_TO_50 }

final upDiscountValues = EnumValues(
    {"Up To 40%": UpDiscount.UP_TO_40, "Up To 50%": UpDiscount.UP_TO_50});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
