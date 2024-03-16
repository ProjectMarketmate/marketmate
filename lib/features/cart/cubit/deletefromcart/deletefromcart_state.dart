part of 'deletefromcart_cubit.dart';

@immutable
sealed class DeletefromcartState {}

final class DeletefromcartInitial extends DeletefromcartState {}

final class DeletefromcartLoading extends DeletefromcartState {}

final class DeletefromcartSuccess extends DeletefromcartState {}

final class DeletefromcartFailed extends DeletefromcartState {
  final String error;
  DeletefromcartFailed({required this.error});
}
