// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  int id;
  String name;
  String description;
  String mrp;
  String nrp;
  String thumbnail;
  bool stockAvailable;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  int category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.mrp,
    required this.nrp,
    required this.thumbnail,
    required this.stockAvailable,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    print(json);

    return Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      mrp: json["mrp"],
      nrp: json["nrp"],
      thumbnail: json["thumbnail"],
      stockAvailable: json["stockAvailable"],
      isActive: json["is_active"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "mrp": mrp,
        "nrp": nrp,
        "thumbnail": thumbnail,
        "stockAvailable": stockAvailable,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "category": category,
      };
}
