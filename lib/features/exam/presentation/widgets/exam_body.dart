import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/exam/presentation/widgets/drop_down_button.dart';
import 'package:quiz_app/features/questions/presentation/pages/questionsScreen.dart';

import '../../../../core/widgets/customButton.dart';
import '../bloc/exam_bloc.dart';

class ExamBody extends StatefulWidget {
  final int id;
  ExamBody({super.key, required this.id});

  @override
  State<ExamBody> createState() => _ExamBodyState();
}

class _ExamBodyState extends State<ExamBody> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    context.read<ExamBloc>().add(GetGroupData());
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamBloc, ExamState>(
      listener: (context, state) {
        if (state is ExamErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.failure.errorMsg),
              backgroundColor: Colors.red.shade800));
        }
        if (state is ExamSuccessState) {}
        if (state is ExamStartSuccessState) {
          name.text = "";
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => QuestionPage(
                  id: widget.id ?? 0,
                  participantId: state.examStartModel.id,
                )),
          );
        }
        if (state is ExamStartErrorState) {

        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextFormField(
                    controller: name,
                    onTapOutside: (tab) =>
                    FocusScope
                        .of(context)
                        .unfocus,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ismingizni kiriting!'; // Hata mesajı
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Ismingizni kiriting",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                        const BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropDownButton(
                  selectedId: (int value) {
                    currentIndex = value;
                  },
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomButton(
                      title: "BOSHLASH",
                      backColor: Colors.green.withOpacity(0.56),
                      textColor: Colors.white,
                      height: 50,
                      width: double.infinity,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ExamBloc>().add(SendExamDataEvent(
                              name: name.text,
                              groupId: currentIndex + 1,
                              themeId: widget.id
                          ));
                        }
                      },
                      borderRadius: 12,
                      textSize: 18),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomButton(
                      title: "BOSHQA TEST TANLASH",
                      backColor: Colors.green.withOpacity(0.56),
                      textColor: Colors.white,
                      height: 50,
                      width: double.infinity,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      borderRadius: 12,
                      textSize: 18),
                ),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.04),
              ],
            ),
          ),
        );
      },
    );
  }
}
