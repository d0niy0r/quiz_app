import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/error/failure.dart';
import 'package:quiz_app/features/questions/data/model/check_questions_model.dart';
import 'package:quiz_app/features/questions/data/model/question_model.dart';
import 'package:quiz_app/features/questions/data/repository/questions_repository_impl.dart';
import 'package:quiz_app/features/questions/domain/usecase/questions_usecase.dart';

part 'questions_event.dart';

part 'questions_state.dart';

class QuestionsBloc extends Bloc<QuestionsEvent, QuestionsState> {
  QuestionsBloc() : super(QuestionsInitial()) {

    on<GetQuestions>((event, emit) async {
      emit(QuestionsLoadingState());
      final res = await QuestionsUseCase().call(QustionsRepositoryImplement());
      final questionRes = await res.getQuestion(id: event.id);
      questionRes.fold((l) => emit(QuestionsErrorState(failure: l)),
          (r) => emit(QuestionsSuccessState(questionModel: r)));
    });

    on<CheckQuestion>((event, emit) async {
      emit(QuestionsLoadingState());
      final response = await QuestionsUseCase().call(QustionsRepositoryImplement());
      final checkQuestion = await response.checkQuestion(question: event.question, answer: event.answer, participant: event.participant);
      checkQuestion.fold((l) => emit(CheckQuestionErrorState(failure: l)),
              (r) => emit(CheckQuestionSuccessState(checkQuestionsModel: r)));
    });


  }
}
