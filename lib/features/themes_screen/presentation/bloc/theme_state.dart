part of 'theme_bloc.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeLoadingState extends ThemeState {}

final class ThemeSuccessState extends ThemeState {
  final ThemeModel themeModel;
  ThemeSuccessState({required this.themeModel});
}

final class ThemeErrorState extends ThemeState {
  final Failure failure;
  ThemeErrorState({required this.failure});
}
