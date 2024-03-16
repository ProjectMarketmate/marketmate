import 'package:bloc/bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:meta/meta.dart';

part 'deletefromcart_state.dart';

class DeletefromcartCubit extends Cubit<DeletefromcartState> {
  DeletefromcartCubit() : super(DeletefromcartInitial());

  void deletefromcart({required int cartItemId}) async {
    emit(DeletefromcartLoading());
    try {
      final resp = await dioClient.delete(
        '/app/cart/delete/${cartItemId}/',
      );
      emit(DeletefromcartSuccess());
    } catch (e) {
      emit(DeletefromcartFailed(error: e.toString()));
    }
  }
}
