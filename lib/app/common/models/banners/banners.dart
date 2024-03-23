import 'package:collection/collection.dart';

class Banners {
  int? id;
  String? title;
  String? description;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Banners({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Banners) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
