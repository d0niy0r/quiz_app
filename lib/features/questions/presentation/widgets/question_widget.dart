import 'package:flutter/material.dart';
import '../../../../core/styles/constants.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions, required this.options,});

  final List options;
  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text("Savol ${widget.indexAction + 1} dan ${widget.totalQuestions}  \n\n${widget.question}",
          style: TextStyle(
            fontSize: 24,
            color: neutral
          ),),
        ),
      ],
    );
  }
}
