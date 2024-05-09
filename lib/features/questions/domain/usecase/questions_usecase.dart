
import 'package:quiz_app/features/questions/data/repository/questions_repository_impl.dart';
import '../../../../main/usecase/usecase.dart';

class QuestionsUseCase extends UseCase<QustionsRepositoryImplement, QustionsRepositoryImplement>{
  @override
  Future<QustionsRepositoryImplement> call(QustionsRepositoryImplement param) async{
    return param;
  }
}