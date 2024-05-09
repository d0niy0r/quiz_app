part of 'questions_bloc.dart';

@immutable
sealed class QuestionsState {}

final class QuestionsInitial extends QuestionsState {}

final class QuestionsLoadingState extends QuestionsState {}

final class QuestionsSuccessState extends QuestionsState {
  final QuestionModel questionModel;
  QuestionsSuccessState({required this.questionModel});
}

final class QuestionsErrorState extends QuestionsState {
  final Failure failure;
  QuestionsErrorState({required this.failure});
}

final class CheckQuestionSuccessState extends QuestionsState {
  final CheckQuestionsModel checkQuestionsModel;
  CheckQuestionSuccessState({required this.checkQuestionsModel});
}

final class CheckQuestionErrorState extends QuestionsState {
  final Failure failure;
  CheckQuestionErrorState({required this.failure});
}
