import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/questions/data/model/group_model.dart';

abstract class ExamRepository{
  Future<Either<Failure, GroupModel>> getGroupData();
  Future<Either<Failure, GroupModel>> sendExamData({
    required String fullName,
    required int groupId,
    required int themeId,
});

}