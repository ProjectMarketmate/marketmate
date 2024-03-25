part of 'passwordless_cubit.dart';

@immutable
sealed class PasswordlessState {}

final class PasswordlessInitial extends PasswordlessState {}
final class PasswordlessLoading extends PasswordlessState {}

final class PasswordlessSuccess extends PasswordlessState {
  final String email;
  PasswordlessSuccess({required this.email});
}
final class PasswordlessFailed extends PasswordlessState {
  final String error;
  PasswordlessFailed({required this.error});
}
