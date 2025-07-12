class PromotionEntity {
  final String id;
  final String name;

  PromotionEntity({required this.id, required this.name});

  factory PromotionEntity.fromJson(Map<String, dynamic> json) {
    return PromotionEntity(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }
}
