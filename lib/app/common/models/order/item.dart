import 'package:marketmate/app/common/models/products.dart';

class Item {
  int? id;
  Product? product;
  int? quantity;
  int? order;

  Item({this.id, this.product, this.quantity, this.order});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
        order: json['order'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product': product?.toJson(),
        'quantity': quantity,
        'order': order,
      };
}
