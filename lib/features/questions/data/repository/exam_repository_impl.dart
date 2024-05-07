import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/network/api_client.dart';
import 'package:quiz_app/features/questions/data/model/group_model.dart';
import 'package:quiz_app/features/questions/domain/repository/exam_repository.dart';

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
  Future<Either<Failure, String>> sendExamData(
      {required String fullName,
      required int groupId,
      required int themeId}) async {
    final request = await ApiClient().postMethod(
        pathUrl: "creat-participant/",
        body: {
          "full_name": fullName,
          "group": groupId,
          "theme": themeId,
        },
        isHeader: true);
    if(request.isSuccess){
      return const Right("");
    }
    return Left(Failure(errorMsg: request.response.toString()));
  }
}
