
import '../../../../main/usecase/usecase.dart';
import '../../data/repository/exam_repository_impl.dart';


class ExamUseCase extends UseCase<ExamRepositoryImplement, ExamRepositoryImplement>{
  @override
  Future<ExamRepositoryImplement> call(ExamRepositoryImplement param) async{
    return param;
  }
}