import '../../../../main/usecase/usecase.dart';
import '../../data/repository/themes_repository_impl.dart';

class ThemesUseCase extends UseCase<ThemesRepositoryImplement, ThemesRepositoryImplement>{
  @override
  Future<ThemesRepositoryImplement> call(ThemesRepositoryImplement param) async{
    return param;
  }
}