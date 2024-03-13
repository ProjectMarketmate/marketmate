import 'package:marketmate/app/common/models/products.dart';

class CartItem {
  int? id;
  int? quantity;
  int? user;
  Product? product;

  CartItem({this.id, this.quantity, this.user, this.product});

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'] as int?,
        quantity: json['quantity'] as int?,
        user: json['user'] as int?,
        product: Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'user': user,
        'product': product,
      };
}
