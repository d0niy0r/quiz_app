import 'package:quiz_app/features/rating/data/repository/rating_repository_impl.dart';
import '../../../../main/usecase/usecase.dart';

class RatingUseCase extends UseCase<RatingRepositoryImplement, RatingRepositoryImplement>{
  @override
  Future<RatingRepositoryImplement> call(RatingRepositoryImplement param) async{
    return param;
  }
}