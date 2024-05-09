import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/rating/data/model/rating_model.dart';
import 'package:quiz_app/features/rating/data/repository/rating_repository_impl.dart';
import 'package:quiz_app/features/rating/domain/usecase/rating_usecase.dart';

part 'rating_event.dart';

part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(RatingInitial()) {
    on<GetRating>((event, emit) async {
      emit(RatingLoadingState());
      final res = await RatingUseCase().call(RatingRepositoryImplement());
      final ratingRes =
          await res.getRating(groupId: event.groupId, themeId: event.themeId);
      ratingRes.fold(
        (l) => emit(RatingErrorState(failure: l)),
        (r) => emit(RatingSuccessState(ratingModel: r)),
      );
    });
  }
}
