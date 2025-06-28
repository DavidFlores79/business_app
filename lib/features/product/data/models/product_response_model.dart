// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:business_app/features/product/data/models/product_model.dart';

ProductResponseModel productResponseModelFromJson(String str) =>
    ProductResponseModel.fromJson(json.decode(str));

String productResponseModelToJson(ProductResponseModel data) =>
    json.encode(data.toJson());

class ProductResponseModel {
  int? page;
  int? pageSize;
  int? totalItems;
  List<ProductModel>? data;

  ProductResponseModel({this.page, this.pageSize, this.totalItems, this.data});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        page: json["page"],
        pageSize: json["pageSize"],
        totalItems: json["totalItems"],
        data:
            json["data"] == null
                ? []
                : List<ProductModel>.from(
                  json["data"]!.map((x) => ProductModel.fromJson(x)),
                ),
      );

  Map<String, dynamic> toJson() => {
    "page": page,
    "pageSize": pageSize,
    "totalItems": totalItems,
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
