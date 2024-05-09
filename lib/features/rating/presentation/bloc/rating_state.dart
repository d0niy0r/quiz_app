part of 'rating_bloc.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingLoadingState extends RatingState {}

final class RatingSuccessState extends RatingState {
  final RatingModel ratingModel;
  RatingSuccessState({required this.ratingModel});
}

final class RatingErrorState extends RatingState {
  final Failure failure;
  RatingErrorState({required this.failure});
}
