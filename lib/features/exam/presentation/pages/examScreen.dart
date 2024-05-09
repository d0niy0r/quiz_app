import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/exam_bloc.dart';
import '../widgets/exam_body.dart';



class ExamPage extends StatelessWidget {
  final int id;
  ExamPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ExamBody(id: id ?? 0),
    );
  }
}
