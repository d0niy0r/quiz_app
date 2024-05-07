import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/exam_bloc.dart';
import '../widgets/exam_body.dart';



class ExamPage extends StatefulWidget {
  final int id;

  ExamPage({Key? key, required this.id}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  late int currentId;

  @override
  void initState() {
    super.initState();
    currentId = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExamBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: ExamBody(id: currentId ?? 0),
      ),
    );
  }
}
