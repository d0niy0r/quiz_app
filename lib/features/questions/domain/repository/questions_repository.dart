import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/questions/data/model/check_questions_model.dart';
import 'package:quiz_app/features/questions/data/model/question_model.dart';

abstract class QuestionsRepository {
  Future<Either<Failure, QuestionModel>> getQuestion({required int id});

  Future<Either<Failure, CheckQuestionsModel>> checkQuestion({
    required String question,
    required String answer,
    required String participant,
  });
}
