class ProductCategory {
  int? id;
  String? name;
  String? image;

  ProductCategory({this.id, this.name, this.image});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
