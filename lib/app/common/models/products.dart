
class Product {
  int? id;
  String? name;
  String? description;
  String? mrp;
  String? nrp;
  String? thumbnail;
  bool? stockAvailable;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.mrp,
    this.nrp,
    this.thumbnail,
    this.stockAvailable,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        mrp: json['mrp'] as String?,
        nrp: json['nrp'] as String?,
        thumbnail: json['thumbnail'] as String?,
        stockAvailable: json['stockAvailable'] as bool?,
        isActive: json['is_active'] as bool?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        category: json['category'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'mrp': mrp,
        'nrp': nrp,
        'thumbnail': thumbnail,
        'stockAvailable': stockAvailable,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'category': category,
      };
}
