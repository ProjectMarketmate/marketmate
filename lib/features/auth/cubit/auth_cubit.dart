
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';

import '../../common/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  
  AuthCubit() : super(AuthInitial());

void login({
      required String email,
      required String password,
    })async{
      emit(AuthLoading());
      try {
        final resp = await dioClient.post('/account/login/', data: {
          "email": email,
          "password": password,
        });

        
        emit(AuthSuccess(user: User.fromJson(resp.data)));
      }on DioException catch (e) {
        log(e.response?.data.toString() ?? "");
        emit(AuthFailed(error: e.toString()));
      } catch (e) {
        emit(AuthFailed(error: e.toString()));
      }
    }
}