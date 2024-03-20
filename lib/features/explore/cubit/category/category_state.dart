part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  final List<Product> products;

  CategorySuccess({required this.products});
}

final class CategoryFailed extends CategoryState {
  final String error;

  CategoryFailed({required this.error});
}
