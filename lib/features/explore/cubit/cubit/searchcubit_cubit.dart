import 'package:bloc/bloc.dart';
import 'package:marketmate/app/common/models/products.dart';
import 'package:marketmate/app/utils/dio_client.dart';
import 'package:meta/meta.dart';

part 'searchcubit_state.dart';

class SearchcubitCubit extends Cubit<SearchcubitState> {
  SearchcubitCubit() : super(SearchcubitInitial());

  void searchProducts(String? query)async{

    try {
      final resp =await  dioClient.get('/app/products/',
      queryParameters: {
       if(query!=null) "search":query
      });

      List<Product> products = [
        for(final p in resp.data) Product.fromJson(p)
      ];
      emit(SearchcubitSuccess(products));

    } catch (e) {
        emit(SearchcubitFailed(error: "Unable to search"));
    }
  }

}
