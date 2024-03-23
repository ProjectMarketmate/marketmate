import 'item.dart';

class Order {
  int? id;
  int? user;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Item>? items;

  Order({
    this.id,
    this.user,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'] as int?,
        user: json['user'] as int?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'items': items?.map((e) => e.toJson()).toList(),
      };
}

class ORDER_STATUS {
  static const String PENDING = 'Pending';
  static const String PROCESSING = 'Processing';
  static const String SHIPPED = 'Shipped';
  static const String DELIVERED = 'Delivered';
  static const String CANCELED = 'Canceled';

  static const Map<String, String> choices = {
    PENDING: 'Pending',
    PROCESSING: 'Processing',
    SHIPPED: 'Shipped',
    DELIVERED: 'Delivered',
    CANCELED: 'Canceled',
  };
}
