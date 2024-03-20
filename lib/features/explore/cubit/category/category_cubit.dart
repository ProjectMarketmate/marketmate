import 'package:bloc/bloc.dart';
import 'package:marketmate/app/common/models/products.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  void getCategoryProduct({required int categoryId}) async {
    emit(CategoryLoading());
    try {
      final resp = await dioClient
          .get("app/products/", queryParameters: {"category": categoryId});
      final List<Product> products = [
        for (var item in resp.data) Product.fromJson(item)
      ];
      emit(CategorySuccess(products: products));
    } catch (e) {
      emit(CategoryFailed(error: e.toString()));
    }
  }
}
