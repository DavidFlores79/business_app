import 'package:flutter/cupertino.dart';

class ProductModel {
  String? id;
  String? name;
  String? image;
  CategoryModel? category;
  double? price;
  String? description;
  double? rating;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.category,
    this.price,
    this.description,
    this.rating = 0.0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    category:
        json["category"] == null
            ? null
            : CategoryModel.fromJson(json["category"]),
    price: double.tryParse(json["price"]?.toString() ?? '0') ?? 0.0,
    description: json["description"],
    rating: double.tryParse(json["rating"]?.toString() ?? '0') ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "category": category?.toJson(),
    "price": price?.toString(),
    "description": description,
    "rating": rating?.toString(),
  };
}

class CategoryModel {
  String? image;
  IconData? icon;
  String? id;
  String? name;
  bool? status;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? creator;

  CategoryModel({
    this.image,
    this.icon,
    this.id,
    this.name,
    this.status,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.creator,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    image: json["image"],
    icon: json["icon"] != null ? IconData(json["icon"]) : null,
    id: json["_id"],
    name: json["name"],
    status: json["status"],
    deleted: json["deleted"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    creator: json["creator"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "icon": icon, // Assuming icon is stored as codePoint
    "_id": id,
    "name": name,
    "status": status,
    "deleted": deleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "creator": creator,
  };
}
