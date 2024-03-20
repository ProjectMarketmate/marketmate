part of 'searchcubit_cubit.dart';

@immutable
sealed class SearchcubitState {}

final class SearchcubitInitial extends SearchcubitState {}

final class SearchcubitLoading extends SearchcubitState {}

final class SearchcubitSuccess extends SearchcubitState {
  final List<Product> productList;

  SearchcubitSuccess(this.productList);
  
}

final class SearchcubitFailed extends SearchcubitState {
  final String error;

  SearchcubitFailed({required this.error});

}

