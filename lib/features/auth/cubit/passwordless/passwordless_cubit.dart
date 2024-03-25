import 'package:bloc/bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:meta/meta.dart';

part 'passwordless_state.dart';

class PasswordlessCubit extends Cubit<PasswordlessState> {
  PasswordlessCubit() : super(PasswordlessInitial());

  void passwordless({
    required String email
  }) async{
    emit(PasswordlessLoading());
    try {
      final resp= await dioClient.post('/account/passwordless/', data: {
        'email': email
      });
      
    } catch (e) {
      
    }
  }
}
