// To parse this JSON data, do
//
//     final categoryListModel = categoryListModelFromJson(jsonString);

import 'dart:convert';

CategoryListModel categoryListModelFromJson(String str) => CategoryListModel.fromJson(json.decode(str));

String categoryListModelToJson(CategoryListModel data) => json.encode(data.toJson());

class CategoryListModel {
    int? status;
    String? message;
    Result? result;

    CategoryListModel({
        this.status,
        this.message,
        this.result,
    });

    CategoryListModel copyWith({
        int? status,
        String? message,
        Result? result,
    }) => 
        CategoryListModel(
            status: status ?? this.status,
            message: message ?? this.message,
            result: result ?? this.result,
        );

    factory CategoryListModel.fromJson(Map<String, dynamic> json) => CategoryListModel(
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
    List<Category>? category;

    Result({
        this.category,
    });

    Result copyWith({
        List<Category>? category,
    }) => 
        Result(
            category: category ?? this.category,
        );

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["Category"] == null ? [] : List<Category>.from(json["Category"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
    };
}

class Category {
    int? id;
    String? name;
    int? isAuthorize;
    int? update080819;
    int? update130919;
    List<SubCategory>? subCategories;

    Category({
        this.id,
        this.name,
        this.isAuthorize,
        this.update080819,
        this.update130919,
        this.subCategories,
    });

    Category copyWith({
        int? id,
        String? name,
        int? isAuthorize,
        int? update080819,
        int? update130919,
        List<SubCategory>? subCategories,
    }) => 
        Category(
            id: id ?? this.id,
            name: name ?? this.name,
            isAuthorize: isAuthorize ?? this.isAuthorize,
            update080819: update080819 ?? this.update080819,
            update130919: update130919 ?? this.update130919,
            subCategories: subCategories ?? this.subCategories,
        );

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["Id"],
        name: json["Name"],
        isAuthorize: json["IsAuthorize"],
        update080819: json["Update080819"],
        update130919: json["Update130919"],
        subCategories: json["SubCategories"] == null ? [] : List<SubCategory>.from(json["SubCategories"]!.map((x) => SubCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "IsAuthorize": isAuthorize,
        "Update080819": update080819,
        "Update130919": update130919,
        "SubCategories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
    };
}

class SubCategory {
    int? id;
    String? name;
    List<Product>? product;

    SubCategory({
        this.id,
        this.name,
        this.product,
    });

    SubCategory copyWith({
        int? id,
        String? name,
        List<Product>? product,
    }) => 
        SubCategory(
            id: id ?? this.id,
            name: name ?? this.name,
            product: product ?? this.product,
        );

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["Id"],
        name: json["Name"],
        product: json["Product"] == null ? [] : List<Product>.from(json["Product"]!.map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Product": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
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
