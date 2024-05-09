import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/exam/data/model/exam_start_response.dart';

import '../../data/model/group_model.dart';
import '../../data/repository/exam_repository_impl.dart';
import '../../domain/usecase/exam_usecase.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc() : super(ExamInitial()) {

    on<GetGroupData>((event, emit) async{
      emit(ExamLoadingState());
      final res = await ExamUseCase().call(ExamRepositoryImplement());
      final groupRes = await res.getGroupData();
      groupRes.fold(
        (l) => emit(ExamErrorState(failure: l)),
        (r) => emit(ExamSuccessState(groupModel: r)),
      );
    });

    on<SendExamDataEvent>((event, emit) async{
      emit(ExamLoadingState());
      final request = await ExamUseCase().call(ExamRepositoryImplement());
      final examStartModel = await request.startExamination(
        fullName: event.name,
        groupId: event.groupId,
        themeId: event.themeId,
      );

      examStartModel.fold(
        (l) => emit(ExamStartErrorState(failure: l)),
        (r) => emit(ExamStartSuccessState(examStartModel: r)),
      );
    });

  }
}
