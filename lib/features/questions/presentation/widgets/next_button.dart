import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/constants.dart';
import '../bloc/questions_bloc.dart';

class NextButton extends StatefulWidget {
  const NextButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<NextButton> createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: backColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(
            "Next Question",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
