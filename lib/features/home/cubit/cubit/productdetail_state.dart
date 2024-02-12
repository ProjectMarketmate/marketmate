part of 'productdetail_cubit.dart';

@immutable
sealed class ProductdetailState {}

final class ProductdetailInitial extends ProductdetailState {}
final class ProductdetailLoading extends ProductdetailState {}
final class ProductdetailSuccess extends ProductdetailState {
  final List<Product> products;
  ProductdetailSuccess({required this.products});
}

final class ProductdetailFailed extends ProductdetailState {
  final String error;
  ProductdetailFailed({required this.error});
}
