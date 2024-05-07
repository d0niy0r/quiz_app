import 'package:flutter/material.dart';

import '../../../../core/styles/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({super.key, required this.option, required this.color,});

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      child: Card(
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(24),
          side: const BorderSide(
            color: Colors.greenAccent,
          ),
        ),
        color: color,
        child: ListTile(
          title: Text(
            option,
            textAlign: TextAlign.center,
            style:  TextStyle(
                fontSize: 22,
            color: color.red != color.green ? neutral : Colors.white ),
          ),
        ),
      ),
    );
  }
}
