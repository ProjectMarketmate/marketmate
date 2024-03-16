import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/explore/models/product_category.dart';
import 'package:meta/meta.dart';

part 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreInitial());

  void getAllCategories()async{
      emit(ExploreLoading());
    try {
      final resp = await dioClient.get("app/categories/");
      final List<ProductCategory> categories = [
        for (var item in resp.data) ProductCategory.fromJson(item)
      ];
      emit(ExploreSuccess(categories: categories));
    } catch (e) {
      emit(ExploreFailed(error: e.toString()));
    }
  }
}
