import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/rating/presentation/widgets/group_drop_down_button.dart';
import 'package:quiz_app/features/rating/presentation/widgets/rating_table.dart';
import 'package:quiz_app/features/rating/presentation/widgets/theme_drop_down_button.dart';
import '../../../exam/presentation/bloc/exam_bloc.dart';
import '../../../themes_screen/presentation/bloc/theme_bloc.dart';
import '../bloc/rating_bloc.dart';

import 'package:flutter/material.dart';

class RatingBodyPage extends StatefulWidget {
  const RatingBodyPage({Key? key}) : super(key: key);

  @override
  State<RatingBodyPage> createState() => _RatingBodyPageState();
}

class _RatingBodyPageState extends State<RatingBodyPage> {
  int selectedGroup = 0;
  int selectedTheme = 0;
  final _formKey = GlobalKey<FormState>();
  bool isPressed = false;

  @override
  void initState() {
    context.read<ExamBloc>().add(GetGroupData());
    context.read<ThemeBloc>().add(GetThemeDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ThemeDropDownButton(
            selectedId: (int value) {
              setState(() {
                selectedTheme = value;
              });
            },
          ),
          GroupDropDownButton(
            selectedId: (int value) {
              setState(() {
                selectedGroup = value;
              });
            },
          ),
          CupertinoButton(
              color: Colors.blueAccent,
              child: const Text("Ko'rish"),
              onPressed: () {
                print(selectedTheme);
                print(selectedGroup);
                if (_formKey.currentState!.validate()) {
                  context.read<RatingBloc>().add(GetRating(
                      groupId: (selectedGroup).toString(),
                      themeId: (selectedTheme).toString()));
                  setState(() {
                    isPressed = true;
                  });
                }

              }),
          const SizedBox(height: 10),
          !isPressed
              ? const Center(
                  child: Text(
                    "Guruh va mavzular tanlanmagan.",
                    style: TextStyle(color: Colors.red, fontSize: 24),
                  ),
                )
              : const RatingTable(),
        ],
      ),
    );
  }
}
