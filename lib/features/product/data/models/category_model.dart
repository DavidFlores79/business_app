import 'package:flutter/material.dart';

class CategoryModel {
  String? image;
  IconData? icon;
  String? id;
  String? name;
  bool? status;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    this.image,
    this.icon,
    this.id,
    this.name,
    this.status,
    this.deleted,
    this.createdAt,
    this.updatedAt,
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
  };
}
