import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/questions/presentation/widgets/question_widget.dart';

import '../../../../core/styles/constants.dart';
import '../../../exam/domain/entity/questionsModel.dart';
import '../bloc/questions_bloc.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/question_body.dart';
import '../widgets/result_box.dart';

class QuestionPage extends StatefulWidget {
  final int id;
  final int participantId;
  const QuestionPage({super.key, required this.id, required this.participantId});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.transparent,
          backgroundColor: backColor,
          title: const Text("Sinov"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: QuestionBody(
          id: widget.id, participantId: widget.participantId,
        ),
      ),
    );
  }
}

