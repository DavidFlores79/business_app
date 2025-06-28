import 'profile_model.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? image;
  Profile? profile;
  bool? status;
  bool? deleted;
  bool? google;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? phoneVerificationCode;
  DateTime? phoneVerificationCodeExpiresAt;
  String? imagePublicId;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.profile,
    this.status,
    this.deleted,
    this.google,
    this.createdAt,
    this.updatedAt,
    this.phoneVerificationCode,
    this.phoneVerificationCodeExpiresAt,
    this.imagePublicId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    status: json["status"],
    deleted: json["deleted"],
    google: json["google"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    phoneVerificationCode: json["phoneVerificationCode"],
    phoneVerificationCodeExpiresAt:
        json["phoneVerificationCodeExpiresAt"] == null
            ? null
            : DateTime.parse(json["phoneVerificationCodeExpiresAt"]),
    imagePublicId: json["imagePublicId"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "image": image,
    "profile": profile?.toJson(),
    "status": status,
    "deleted": deleted,
    "google": google,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "phoneVerificationCode": phoneVerificationCode,
    "phoneVerificationCodeExpiresAt":
        phoneVerificationCodeExpiresAt?.toIso8601String(),
    "imagePublicId": imagePublicId,
  };
}
