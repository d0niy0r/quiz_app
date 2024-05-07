import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/core/network/api_client.dart';

import '../../domain/repository/themes_repository.dart';
import '../model/themes_model.dart';

class ThemesRepositoryImplement extends ThemesRepository{
  
  @override
  Future<Either<Failure, ThemeModel>> getThemes() async {
    final res = await ApiClient().getMethod(pathUrl: "themes/", isHeader: true);
    if (res.isSuccess) {
      var jsonResponse = res.response as Map<String, dynamic>;
      return Right(ThemeModel.fromMap(jsonResponse));
    } else {
      return Left(Failure(errorMsg: res.response.toString()));
    }

  }
  }