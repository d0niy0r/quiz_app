part of 'exam_bloc.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamLoadingState extends ExamState {}

final class ExamSuccessState extends ExamState {
  final GroupModel groupModel;
  ExamSuccessState({required this.groupModel});
}

final class ExamErrorState extends ExamState {
  final Failure failure;
  ExamErrorState({required this.failure});
}
