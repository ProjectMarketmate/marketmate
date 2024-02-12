import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/common/models/productmodel.dart';

import 'package:meta/meta.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());




  void getProducts()async{
      emit(HomeViewLoading());
      try {
          final resp = await dioClient.get("/products/");
          emit(HomeViewSuccess(products: (resp.data as List).map((e) => Product.fromJson(e)).toList()));
      } catch (e) {
          emit(HomeViewFailed(error: e.toString()));
      }
  }
}
