import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../exam/presentation/bloc/exam_bloc.dart';
import '../bloc/rating_bloc.dart';

class GroupDropDownButton extends StatefulWidget {
  final ValueChanged<int> selectedId;

  const GroupDropDownButton({super.key, required this.selectedId,});

  @override
  State<GroupDropDownButton> createState() => _GroupDropDownButtonState();
}

class _GroupDropDownButtonState extends State<GroupDropDownButton> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        if (state is ExamSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 250,
              height: 70,
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Guruhingizni tanlang',
                  style: TextStyle(fontSize: 14),
                ),
                items: state.groupModel.results
                    ?.asMap()
                    .entries
                    .map(
                      (entry) => DropdownMenuItem<String>(
                    value: entry.value.name,
                    child: Text(
                      entry.value.name ?? "",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Guruhni tanlang!';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    selectedIndex = state.groupModel.results
                        !.indexWhere((element) => element.name == value);
                    widget.selectedId(selectedIndex + 1);
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          );
        }
        if (state is ExamErrorState) {
          return const Center(
            child: Text("error"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
