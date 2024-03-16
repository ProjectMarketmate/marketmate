import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/app/common/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  void signup({
    required String email,
    required String password,
    required String mobile,
    required String firstName,
    required String lastname,
  }) async {
    emit(SignupLoading());
    try {
      final resp = await dioClient.post('/account/register/', data: {
        "email": email,
        "password": password,
        "mobile": mobile,
        "first_name": firstName,
        "last_name": lastname,
        "is_admin": false
      });

      emit(SignupSuccess());
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? "");
      emit(SignupFailed(error: e.toString()));
    } catch (e) {
      emit(SignupFailed(error: e.toString()));
    }
  }
}
