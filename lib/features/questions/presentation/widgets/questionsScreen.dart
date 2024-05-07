import 'package:flutter/material.dart';
import 'package:quiz_app/features/questions/presentation/widgets/question_widget.dart';
import 'package:quiz_app/features/questions/presentation/widgets/result_box.dart';

import '../../../../core/styles/constants.dart';
import '../../domain/entity/questionsModel.dart';
import 'next_button.dart';
import 'option_card.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final List<Question> _questions = [
    Question(
      id: '1',
      title: 'what is 2 + 3 ?',
      options: {
        "5": false,
        "30": false,
        "4": true,
        "10": false,
      },
    ),
    Question(
      id: '2',
      title: 'what is 10 + 20 ?',
      options: {
        "50": false,
        "30": true,
        "40": false,
        "10": false,
      },
    )
  ];
  // var db =DBconnect();
  // late Future _questions;
  // Future<List<Question>> getData() async{
  //   return db.fetchQuestions();
  // }
  @override
  void initState() {
    // _questions = getData();
    super.initState();
  }
  int index = 0;
  bool alreadySelected = false;
  bool isPressed = false;
  int score = 0;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        backgroundColor: backColor,
        title: const Text("Sinov"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Score: $score",
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: ()=> nextQuestion(_questions.length),
        borderRadius: BorderRadius.circular(12),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: NextButton(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            QuestionWidget(
              question: _questions[index].title,
              indexAction: index,
              totalQuestions: _questions.length,
              options: _questions,
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            const SizedBox(height: 24),
            for (int i = 0; i < _questions[index].options.length; i++)
              InkWell(
                onTap: () {
                  return changeAnswerAndUpdate(
                      _questions[index].options.values.toList()[i]);
                },
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                      ? correct
                      : incorrect
                      : Colors.black45,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
