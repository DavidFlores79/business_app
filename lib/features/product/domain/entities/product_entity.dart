class ProductEntity {
  final String id;
  final String name;
  final String image;
  final String categoryName;
  final double price;
  final String description;
  final double rating;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryName,
    required this.price,
    required this.description,
    this.rating = 0.0,
  });
}
