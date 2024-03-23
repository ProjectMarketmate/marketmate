import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:marketmate/app/common/models/banners/banners.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'homebanner_state.dart';

class HomebannerCubit extends Cubit<HomebannerState> {
  HomebannerCubit() : super(HomebannerInitial());

  void getHomeBanner() async {
    emit(HomebannerLoading());
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = await prefs.getString('token');
      final resp = await dioClient.get(
        "/app/offers/banners/",
      );
      final List<Banners> banners = [];
      for (var banner in resp.data) {
        banners.add(Banners.fromJson(banner));
      }
      emit(HomebannerSuccess(
          banner: banners ));
    } catch (e) {
      emit(HomebannerFailed(error: e.toString()));
    }
  }
}
