import 'package:quiz_app/features/questions/data/repository/exam_repository_impl.dart';

import '../../../../main/usecase/usecase.dart';


class ExamUseCase extends UseCase<ExamRepositoryImplement, ExamRepositoryImplement>{
  @override
  Future<ExamRepositoryImplement> call(ExamRepositoryImplement param) async{
    return param;
  }
}