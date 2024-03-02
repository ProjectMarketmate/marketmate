import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      final resp = await dioClient.post('/account/login/', data: {
        "email": email,
        "password": password,
      });

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', resp.data['token']);
      emit(AuthSuccess(user: User.fromJson(resp.data)));
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? "");
      emit(AuthFailed(error: e.toString()));
    } catch (e) {
      emit(AuthFailed(error: e.toString()));
    }
  }
}
