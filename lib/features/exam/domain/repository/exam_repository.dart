import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/exam/data/model/exam_start_response.dart';

import '../../data/model/group_model.dart';

abstract class ExamRepository {
  Future<Either<Failure, GroupModel>> getGroupData();

  Future<Either<Failure, ExamStartModel>> startExamination({
    required String fullName,
    required int groupId,
    required int themeId,
  });
}
