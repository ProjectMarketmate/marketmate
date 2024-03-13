import 'package:bloc/bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/cart/models/cart_item.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit()
      : super(
            CartState(status: CartStatus.initial, message: '', cartItems: []));

  void getCartItems() async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final resp = await dioClient.get("/app/cart/");
      final List<CartItem> cartItems = [
        for (var item in resp.data) CartItem.fromJson(item)
      ];
      emit(state.copyWith(
        status: CartStatus.success,
        cartItems: cartItems,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.failure,
        message: e.toString(),
      ));
    }
  }

  void removeProductFromList({required int productId}){
    print(productId);
    emit(state.copyWith(status: CartStatus.loading));
    emit(state.copyWith(
      cartItems: [...state.cartItems
          .where((element) => element.product?.id != productId)
          .toList(),],
      status: CartStatus.success
    ));
 
  }

  void removeProduct({required int id}) async {
    emit(state.copyWith(status: CartStatus.loading));
    try {
      final resp = await dioClient.delete("/app/cart/$id/");
      final List<CartItem> cartItems = [
        for (var item in resp.data) CartItem.fromJson(item)
      ];
      emit(state.copyWith(
        status: CartStatus.success,
        cartItems: cartItems,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CartStatus.failure,
        message: e.toString(),
      ));
    }
  }

  // void addProduct({required Product product}) async{
  //   emit(state.copyWith(
  //     isLoading: true
  //   ));

  //   try {
  //     final resp = await dioClient.post("");
  //   } catch (e) {

  //   }
  // }
}
