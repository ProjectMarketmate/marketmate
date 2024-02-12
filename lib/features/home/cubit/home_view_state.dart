part of 'home_view_cubit.dart';

@immutable
sealed class HomeViewState {}

final class HomeViewInitial extends HomeViewState {}

final class HomeViewLoading extends HomeViewState {}

final class HomeViewSuccess extends HomeViewState {
  final List<Product> products;

  HomeViewSuccess({required this.products});
}

final class HomeViewFailed extends HomeViewState {
  final String error;
  HomeViewFailed({required this.error});
}
