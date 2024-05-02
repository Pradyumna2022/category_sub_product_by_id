// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) =>
    json.encode(data.toJson());

class SubCategoryModel {
  var code;
  var message;
  List<Datum>? data;

  SubCategoryModel({
    this.code,
    this.message,
    this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  var id;
  var name;
  var image;
  var categoryId;
  List<BrandDatum>? brandData;

  Datum({
    this.id,
    this.name,
    this.image,
    this.categoryId,
    this.brandData,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        categoryId: json["category_id"],
        brandData: List<BrandDatum>.from(
            json["brandData"].map((x) => BrandDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "category_id": categoryId,
        "brandData": List<dynamic>.from(brandData!.map((x) => x.toJson())),
      };
}

class BrandDatum {
  var id;
  Name? name;

  BrandDatum({
    this.id,
    this.name,
  });

  factory BrandDatum.fromJson(Map<String, dynamic> json) => BrandDatum(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
      };
}

enum Name { HRS, SG, SS }

final nameValues = EnumValues({"HRS": Name.HRS, "SG": Name.SG, "SS": Name.SS});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
