class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image1;
  final String? image2;
  final String? image3;
  final String type;
  final List<String> colorOptions;
  final double rating; 

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image1,
    this.image2,
    this.image3,
    required this.type,
    required this.colorOptions,
    required this.rating,
  });
}
