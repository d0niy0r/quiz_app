import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/constants.dart';
import '../../../main_screen/presentation/pages/main_page.dart';
import '../../../rating/presentation/pages/rating.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key, required this.result, required this.questionLength, required this.onPressed});

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "NATIJA: ",
              style: TextStyle(color: neutral, fontSize: 22),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow
                  : result < questionLength / 2
                      ? incorrect
                      : correct,
              child: Text(
                "$result/$questionLength",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              result == questionLength / 2
                  ? "YAXSHI )"
                  : result < questionLength / 2
                      ? "QAYTADAN ISHLASH KERE (( ?"
                      : "Ajoyib!",
              style: TextStyle(
                color: neutral,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MainPage(startIndex: 1)),
                      (route) => false,
                );              },
              child: const Text(
                "REYTINGNI KURISH",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue, fontSize: 20, letterSpacing: 1.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
