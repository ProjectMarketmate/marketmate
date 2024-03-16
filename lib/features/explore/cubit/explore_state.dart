part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}

final class ExploreLoading extends ExploreState {}

final class ExploreSuccess extends ExploreState {
  final List<ProductCategory> categories;

  ExploreSuccess({required this.categories});
}

final class ExploreFailed extends ExploreState {
  final String error;

  ExploreFailed({required this.error});
}
