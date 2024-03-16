part of 'updatecart_cubit.dart';

@immutable
sealed class UpdatecartState {}

final class UpdatecartInitial extends UpdatecartState {}

final class UpdatecartLoading extends UpdatecartState {}

final class UpdatecartSuccess extends UpdatecartState {}

final class UpdatecartFailed extends UpdatecartState {
  final String error;
  UpdatecartFailed({required this.error});
}
