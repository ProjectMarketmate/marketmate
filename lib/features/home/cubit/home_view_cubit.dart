import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/app/common/models/products.dart';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());

  void getProducts() async {
    emit(HomeViewLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString('token');
      final resp = await dioClient.get(
        "/app/products/",
        options: Options(
          headers: {
            'Authorization': 'Token $token',
          },
        ),
      );
      emit(HomeViewSuccess(
          products:
              (resp.data as List).map((e) => Product.fromJson(e)).toList()));
    } on DioException catch (e) {
      print(e.response?.data.toString());
    } catch (e) {
      emit(HomeViewFailed(error: e.toString()));
    }
  }
}
