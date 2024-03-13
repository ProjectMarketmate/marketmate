part of 'cart_cubit.dart';

enum CartStatus {
  initial,
  loading,
  success,
  failure,
}

@immutable
class CartState {
  final String message;
  final List<CartItem> cartItems;
  final CartStatus status;
  CartState(
      {required this.status, required this.message, required this.cartItems});

  CartState copyWith({
    CartStatus? status,
    String? message,
    List<CartItem>? cartItems,
  }) {
    return CartState(
      status: status ?? this.status,
      message: message ?? this.message,
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
