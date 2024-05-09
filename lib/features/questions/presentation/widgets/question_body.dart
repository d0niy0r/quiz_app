import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/questions/presentation/widgets/next_button.dart';
import 'package:quiz_app/features/questions/presentation/widgets/question_widget.dart';
import 'package:quiz_app/features/questions/presentation/widgets/result_box.dart';

import '../../../../core/styles/constants.dart';
import '../bloc/questions_bloc.dart';
import 'option_card.dart';

class QuestionBody extends StatefulWidget {
  final int participantId;
  final int id;

  const QuestionBody({Key? key, required this.id, required this.participantId})
      : super(key: key);

  @override
  _QuestionBodyState createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  int index = 0;
  bool alreadySelected = false;
  bool isPressed = false;
  int score = 0;
  // String question = "";
  // String answer = "";
  // String participant = "";
  

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      alreadySelected = false;
    });
    Navigator.of(context).pop();
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => ResultBox(
          result: score,
          questionLength: questionLength,
          onPressed: startOver,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          alreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Iltimos variantlardan birini tanlang"),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
        );
      }
    }
  }

  void changeAnswerAndUpdate(bool value) {
    if (alreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        alreadySelected = true;
      });
    }
  }

  @override
  void initState() {
    context.read<QuestionsBloc>().add(GetQuestions(id: widget.id));
    super.initState();
  }

  int questionLength = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsBloc, QuestionsState>(
      builder: (context, state) {
        if (state is QuestionsSuccessState) {
          // print(state.questionModel.results?[index].id.toString());
          // print(state.questionModel.results?[index].answers?[index].id.toString());
          // print(widget.participantId.toString());
          questionLength = state.questionModel.count ?? 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: state.questionModel.results!.isEmpty
                ? const Center(
                    child: Text("BU MAVZUDA TEST MAVJUD EMAS"),
                  )
                : Column(
                    children: [
                      QuestionWidget(
                        question:
                            state.questionModel.results?[index].title ?? "",
                        indexAction: index,
                        totalQuestions: state.questionModel.count ?? 0,
                        options: state.questionModel.results ?? [],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      const SizedBox(height: 24),
                      for (int i = 0;
                          i <
                              (state.questionModel.results?[index].answers
                                      ?.length ??
                                  0);
                          i++)
                        InkWell(
                          onTap: () {
                            // question = state.questionModel.results?[index].id.toString() ?? "";
                            // answer = state.questionModel.results?[index].answers?[index].id.toString() ?? "";
                            // participant = widget.participantId.toString();
                            return changeAnswerAndUpdate(state.questionModel
                                    .results?[index].answers?[i].isCorrect ??
                                false);
                          },
                          child: OptionCard(
                            option: state.questionModel.results?[index]
                                    .answers?[i].answer ??
                                "",
                            color: isPressed
                                ? state.questionModel.results![index]
                                            .answers![i].isCorrect ==
                                        true
                                    ? correct
                                    : incorrect
                                : Colors.black45,
                          ),
                        ),
                      const Spacer(),
                      NextButton(
                        onPressed: () {
                          // context.read<QuestionsBloc>().add(CheckQuestion(question: question, answer: answer, participant: participant));
                          return nextQuestion(questionLength);
                        },
                        ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
          );
        }
        if (state is QuestionsErrorState) {
          return const Center(child: Text("error"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
