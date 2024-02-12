
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';



final isDev = false;

final _baseOptions = BaseOptions(
  baseUrl:isDev? "http://127.0.0.1:8000/api" : "http://128.199.24.254/api",
  headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  },
);

final dioClient = Dio(
  _baseOptions,
)..interceptors.add(
  InterceptorsWrapper(
    onRequest: (options, handler)async {
      final shared = await SharedPreferences.getInstance();
      final token = shared.getString("token");
      if(token != null){
        options.headers['Authorization'] = 'Token $token';
      }
      return handler.next(options);
     
    },
  ),
);
