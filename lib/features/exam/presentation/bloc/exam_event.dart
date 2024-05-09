part of 'exam_bloc.dart';

@immutable
sealed class ExamEvent {}

final class GetGroupData extends ExamEvent{
  GetGroupData();
}

final class SendExamDataEvent extends ExamEvent {
  final String name;
  final int groupId;
  final int themeId;

  SendExamDataEvent({
    required this.name,
    required this.groupId,
    required this.themeId,
  });
}
