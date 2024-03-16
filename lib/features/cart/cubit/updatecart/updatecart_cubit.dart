import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:meta/meta.dart';

part 'updatecart_state.dart';

class UpdatecartCubit extends Cubit<UpdatecartState> {
  UpdatecartCubit() : super(UpdatecartInitial());

  void updatecartItem({required int cartItemId, required int quantity}) async {
    print(quantity);
    emit(UpdatecartLoading());
    try {
      final resp = await dioClient.patch('/app/cart/update/${cartItemId}/',
          data: {'quantity': quantity});
      emit(UpdatecartSuccess());
    } on DioException catch (e) {
      print(e.response?.data.toString());
    } catch (e) {
      emit(UpdatecartFailed(error: e.toString()));
    }
  }
}
