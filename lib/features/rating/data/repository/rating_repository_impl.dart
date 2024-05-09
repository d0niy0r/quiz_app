import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/network/api_client.dart';
import 'package:quiz_app/features/rating/data/model/rating_model.dart';
import 'package:quiz_app/features/rating/domain/repository/rating_repository.dart';

class RatingRepositoryImplement extends RatingRepository {

  @override
  Future<Either<Failure, RatingModel>> getRating(
      {required String groupId, required String themeId}) async{
    final result = await ApiClient().getMethod(pathUrl: "ratings/?group=$groupId&theme=$themeId", isHeader: true,);
    if(result.isSuccess){
      return Right(RatingModel.fromMap(result.response));
    }
    return Left(Failure(errorMsg: result.response));
  }
}