class Profile {
  String? id;
  String? name;
  bool? status;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? modules;

  Profile({
    this.id,
    this.name,
    this.status,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.modules,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["_id"],
    name: json["name"],
    status: json["status"],
    deleted: json["deleted"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    modules:
        json["modules"] == null
            ? []
            : List<String>.from(json["modules"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "status": status,
    "deleted": deleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "modules":
        modules == null ? [] : List<dynamic>.from(modules!.map((x) => x)),
  };
}
