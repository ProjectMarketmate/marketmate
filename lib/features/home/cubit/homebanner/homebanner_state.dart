part of 'homebanner_cubit.dart';

@immutable
sealed class HomebannerState {}

final class HomebannerInitial extends HomebannerState {}

final class HomebannerLoading extends HomebannerState {}

final class HomebannerSuccess extends HomebannerState {
  final List<Banners> banner;
  HomebannerSuccess({required this.banner});
}

final class HomebannerFailed extends HomebannerState {
  final String error;
  HomebannerFailed({required this.error});
}
