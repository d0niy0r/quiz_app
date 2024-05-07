import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/exam_bloc.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? selectedValue;
  int? selectedIndex;

  @override
  void initState() {
    context.read<ExamBloc>().add(GetGroupData());
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
              height: 50,
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
                  'Select',
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
                    selectedValue = value;
                    selectedIndex = state.groupModel.results
                        ?.indexWhere((element) => element.name == value);
                  });
                },
                onSaved: (value) {
                  selectedValue = value.toString();
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

