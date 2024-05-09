part of 'questions_bloc.dart';

@immutable
sealed class QuestionsEvent {}

final class GetQuestions extends QuestionsEvent{
  final int id;
  GetQuestions({required this.id});
}

final class CheckQuestion extends QuestionsEvent{
  final String question;
  final String answer;
  final String participant;
  CheckQuestion({required this.question, required this.answer, required this.participant});
}