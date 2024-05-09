part of 'rating_bloc.dart';

@immutable
sealed class RatingEvent {}

final class GetRating extends RatingEvent{
  final String groupId;
  final String themeId;
  GetRating({required this.groupId, required this.themeId});
}
