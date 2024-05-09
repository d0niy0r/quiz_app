import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/network/api_client.dart';
import 'package:quiz_app/features/questions/data/model/check_questions_model.dart';
import 'package:quiz_app/features/questions/data/model/question_model.dart';
import 'package:quiz_app/features/questions/domain/repository/questions_repository.dart';

class QustionsRepositoryImplement extends QuestionsRepository {
  @override
  Future<Either<Failure, QuestionModel>> getQuestion({required int id}) async {
    final res =
        await ApiClient().getMethod(pathUrl: "questions/$id/", isHeader: true);
    if (res.isSuccess) {
      return Right(QuestionModel.fromMap(res.response));
    }
    return Left(Failure(errorMsg: res.response.toString()));
  }

  @override
  Future<Either<Failure, CheckQuestionsModel>> checkQuestion({
    required String question,
    required String answer,
    required String participant,
  }) async{
   final response = await ApiClient().getMethod(pathUrl: "check/$question/$answer/$participant/", isHeader: true);
   if (response.isSuccess) {
     return Right(CheckQuestionsModel.fromMap(response.response));
   }
   return Left(Failure(errorMsg: response.response.toString()));
  }
}
