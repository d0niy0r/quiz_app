import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/main_screen/presentation/pages/main_page.dart';
import 'package:quiz_app/features/questions/presentation/bloc/questions_bloc.dart';
import 'package:quiz_app/features/rating/presentation/bloc/rating_bloc.dart';
import 'core/services/cache.dart';
import 'features/exam/presentation/bloc/exam_bloc.dart';
import 'features/themes_screen/presentation/bloc/theme_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => ExamBloc()),
        BlocProvider(create: (context) => QuestionsBloc()),
        BlocProvider(create: (context) => RatingBloc()),
      ],
      child: MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: false,
        ),
        home: MainPage(),
      ),
    );
  }
}
