import 'package:dartz/dartz.dart';
import 'package:quiz_app/features/rating/data/model/rating_model.dart';

import '../../../../core/error/failure.dart';

abstract class RatingRepository {
  Future<Either<Failure, RatingModel>> getRating({required String groupId, required String themeId});
}