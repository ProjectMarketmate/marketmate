part of 'addtocart_cubit.dart';

@immutable
sealed class AddtocartState {}

final class AddtocartInitial extends AddtocartState {}

final class AddtocartLoading extends AddtocartState {}

final class AddtocartSuccess extends AddtocartState {}
