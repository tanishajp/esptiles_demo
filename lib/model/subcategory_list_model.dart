// To parse this JSON data, do
//
//     final subCategoryListModel = subCategoryListModelFromJson(jsonString);

import 'dart:convert';

SubCategoryListModel subCategoryListModelFromJson(String str) =>
    SubCategoryListModel.fromJson(json.decode(str));

String subCategoryListModelToJson(SubCategoryListModel data) =>
    json.encode(data.toJson());

class SubCategoryListModel {
  int? status;
  String? message;
  Result? result;

  SubCategoryListModel({
    this.status,
    this.message,
    this.result,
  });

  SubCategoryListModel copyWith({
    int? status,
    String? message,
    Result? result,
  }) =>
      SubCategoryListModel(
        status: status ?? this.status,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory SubCategoryListModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryListModel(
        status: json["Status"],
        message: json["Message"],
        result: json["Result"] == null ? null : Result.fromJson(json["Result"]),
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Result": result?.toJson(),
      };
}

class Result {
  List<Categories>? category;

  Result({
    this.category,
  });

  Result copyWith({
    List<Categories>? category,
  }) =>
      Result(
        category: category ?? this.category,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["Category"] == null
            ? []
            : List<Categories>.from(
                json["Category"]!.map((x) => Categories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Category": category == null
            ? []
            : List<dynamic>.from(category!.map((x) => x.toJson())),
      };
}

class Categories {
  int? id;
  String? name;
  int? isAuthorize;
  int? update080819;
  int? update130919;
  List<SubCategories>? subCategories;

  Categories({
    this.id,
    this.name,
    this.isAuthorize,
    this.update080819,
    this.update130919,
    this.subCategories,
  });

  Categories copyWith({
    int? id,
    String? name,
    int? isAuthorize,
    int? update080819,
    int? update130919,
    List<SubCategories>? subCategories,
  }) =>
      Categories(
        id: id ?? this.id,
        name: name ?? this.name,
        isAuthorize: isAuthorize ?? this.isAuthorize,
        update080819: update080819 ?? this.update080819,
        update130919: update130919 ?? this.update130919,
        subCategories: subCategories ?? this.subCategories,
      );

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["Id"],
        name: json["Name"],
        isAuthorize: json["IsAuthorize"],
        update080819: json["Update080819"],
        update130919: json["Update130919"],
        subCategories: json["SubCategories"] == null
            ? []
            : List<SubCategories>.from(
                json["SubCategories"]!.map((x) => SubCategories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "IsAuthorize": isAuthorize,
        "Update080819": update080819,
        "Update130919": update130919,
        "SubCategories": subCategories == null
            ? []
            : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
      };
}

class SubCategories {
  int? id;
  String? name;
  List<Product>? product;

  SubCategories({
    this.id,
    this.name,
    this.product,
  });

  SubCategories copyWith({
    int? id,
    String? name,
    List<Product>? product,
  }) =>
      SubCategories(
        id: id ?? this.id,
        name: name ?? this.name,
        product: product ?? this.product,
      );

  factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        id: json["Id"],
        name: json["Name"],
        product: json["Product"] == null
            ? []
            : List<Product>.from(
                json["Product"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Product": product == null
            ? []
            : List<dynamic>.from(product!.map((x) => x.toJson())),
      };
}

class Product {
  String? name;
  String? priceCode;
  String? imageName;
  int? id;

  Product({
    this.name,
    this.priceCode,
    this.imageName,
    this.id,
  });

  Product copyWith({
    String? name,
    String? priceCode,
    String? imageName,
    int? id,
  }) =>
      Product(
        name: name ?? this.name,
        priceCode: priceCode ?? this.priceCode,
        imageName: imageName ?? this.imageName,
        id: id ?? this.id,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["Name"],
        priceCode: json["PriceCode"],
        imageName: json["ImageName"],
        id: json["Id"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "PriceCode": priceCode,
        "ImageName": imageName,
        "Id": id,
      };
}
