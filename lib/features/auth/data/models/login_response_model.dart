// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';
import 'user_model.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  String? message;
  UserModel? data;
  String? jwt;
  List<MenuItem>? menuItems;

  LoginResponseModel({this.message, this.data, this.jwt, this.menuItems});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
        jwt: json["jwt"],
        menuItems:
            json["menuItems"] == null
                ? []
                : List<MenuItem>.from(
                  json["menuItems"]!.map((x) => MenuItem.fromJson(x)),
                ),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
    "jwt": jwt,
    "menuItems":
        menuItems == null
            ? []
            : List<dynamic>.from(menuItems!.map((x) => x.toJson())),
  };
}

class MenuItem {
  String? id;
  String? name;
  String? route;
  String? icon;
  bool? status;
  dynamic parentId;
  int? order;
  DateTime? createdAt;
  DateTime? updatedAt;

  MenuItem({
    this.id,
    this.name,
    this.route,
    this.icon,
    this.status,
    this.parentId,
    this.order,
    this.createdAt,
    this.updatedAt,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
    id: json["_id"],
    name: json["name"],
    route: json["route"],
    icon: json["icon"],
    status: json["status"],
    parentId: json["parent_id"],
    order: json["order"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "route": route,
    "icon": icon,
    "status": status,
    "parent_id": parentId,
    "order": order,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
