import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/network/api_client.dart';
import 'package:quiz_app/features/exam/data/model/exam_start_response.dart';

import '../../domain/repository/exam_repository.dart';
import '../model/group_model.dart';

class ExamRepositoryImplement extends ExamRepository {

  @override
  Future<Either<Failure, GroupModel>> getGroupData() async {
    final res = await ApiClient().getMethod(pathUrl: "groups/", isHeader: true);
    if (res.isSuccess) {
      return Right(GroupModel.fromMap(res.response));
    }
    return Left(Failure(errorMsg: res.response.toString()));
  }

  @override
  Future<Either<Failure, ExamStartModel>> startExamination({
    required String fullName,
    required int groupId,
    required int themeId,
  }) async {
    final response = await ApiClient().postMethod(
      pathUrl: "creat-participant/",
      body: {
        "full_name": fullName,
        "group": groupId,
        "theme": themeId,
      },
      isHeader: true,
    );
    if (response.isSuccess) {

      return Right(ExamStartModel.fromMap(response.response));
    }
    return Left(Failure(errorMsg: response.response.toString()));
  }
}
