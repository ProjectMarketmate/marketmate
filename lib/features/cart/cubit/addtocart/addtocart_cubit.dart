import 'package:bloc/bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/cart/models/cart_item.dart';
import 'package:meta/meta.dart';

part 'addtocart_state.dart';

class AddtocartCubit extends Cubit<AddtocartState> {
  AddtocartCubit() : super(AddtocartInitial());

  void addtocart({required int productId, required int quantity}) async {
    print(quantity);
    emit(AddtocartLoading());
    try {
      final resp = await dioClient.post('/app/cart/',
          data: {'product': productId, 'quantity': quantity});
      emit(AddtocartSuccess());
    } catch (e) {
      emit(AddtocartFailed(error: e.toString()));
    }
  }
}
