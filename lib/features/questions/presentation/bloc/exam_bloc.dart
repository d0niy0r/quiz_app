import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/questions/data/model/group_model.dart';
import 'package:quiz_app/features/questions/data/repository/exam_repository_impl.dart';
import 'package:quiz_app/features/questions/domain/usecase/exam_usecase.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc() : super(ExamInitial()) {

    on<GetGroupData>((event, emit) async{
      emit(ExamLoadingState());
      final res = await ExamUseCase().call(ExamRepositoryImplement());
      final groupRes = await res.getGroupData();
      groupRes.fold((l) => emit(ExamErrorState(failure: l)), (r) => emit(ExamSuccessState(groupModel: r)));
    });

    on<SendExamDataEvent>((event, emit) async{
      emit(ExamLoadingState());
      final res = await ExamUseCase().call(ExamRepositoryImplement());
      final groupRes = await res.getGroupData();
      groupRes.fold((l) => emit(ExamErrorState(failure: l)), (r) => emit(ExamSuccessState(groupModel: r)));
    });

  }
}
