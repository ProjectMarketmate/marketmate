import 'package:bloc/bloc.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:marketmate/features/common/models/productmodel.dart';
import 'package:meta/meta.dart';

part 'productdetail_state.dart';

class ProductdetailCubit extends Cubit<ProductdetailState> {
  ProductdetailCubit() : super(ProductdetailInitial());

  void getProducts()async{
      emit(ProductdetailLoading());
      try {
          final resp = await dioClient.get("/products/");
          emit(ProductdetailSuccess(products:(resp.data as List).map((e) => Product.fromJson(e)).toList()));
      } catch (e) {
          emit(ProductdetailFailed(error: e.toString()));
      }
}
}