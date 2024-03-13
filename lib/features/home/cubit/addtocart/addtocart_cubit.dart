import 'package:bloc/bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:meta/meta.dart';

part 'addtocart_state.dart';

class AddtocartCubit extends Cubit<AddtocartState> {
  AddtocartCubit() : super(AddtocartInitial());

  void addtocart({
    required int productId,
    required int quantity
  })async{
      emit(AddtocartInitial());
      try {
        final resp = await dioClient.post('/app/cart/',data: {
          'product':productId,
          'quantity':quantity
        });
      } catch (e) {
        
      }
  }
}
