import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';

import '../../data/model/themes_model.dart';

abstract class ThemesRepository {
  Future<Either<Failure, ThemeModel>> getThemes();
}