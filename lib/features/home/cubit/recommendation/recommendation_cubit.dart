import 'package:bloc/bloc.dart';
import 'package:marketmate/app/common/models/products.dart';
import 'package:meta/meta.dart';

part 'recommendation_state.dart';

class RecommendationCubit extends Cubit<RecommendationState> {
  RecommendationCubit() : super(RecommendationInitial());
}
