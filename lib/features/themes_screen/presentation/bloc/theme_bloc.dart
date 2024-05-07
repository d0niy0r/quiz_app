import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/error/failure.dart';
import '../../data/model/themes_model.dart';
import '../../data/repository/themes_repository_impl.dart';
import '../../domain/usecase/theme_usecase.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {

    on<GetThemeDataEvent>((event, emit) async{
      emit(ThemeLoadingState());
      final res = await ThemesUseCase().call(ThemesRepositoryImplement());
      final themeRes = await res.getThemes();
      themeRes.fold((l) => emit(ThemeErrorState(failure: l)), (r) => emit(ThemeSuccessState(themeModel: r)));
    });
  }
}
