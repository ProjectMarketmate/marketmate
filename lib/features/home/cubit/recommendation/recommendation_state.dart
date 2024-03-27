part of 'recommendation_cubit.dart';

@immutable
sealed class RecommendationState {}

final class RecommendationInitial extends RecommendationState {}

final class RecommendationLoading extends RecommendationState {}

final class RecommendationSuccess extends RecommendationState {
  final List<Product> products;
  RecommendationSuccess({required this.products});
}

final class RecommendationFailed extends RecommendationState {
  final String error;
  RecommendationFailed({required this.error});
}
