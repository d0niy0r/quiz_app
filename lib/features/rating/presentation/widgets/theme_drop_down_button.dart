import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../themes_screen/presentation/bloc/theme_bloc.dart';

class ThemeDropDownButton extends StatefulWidget {
  final ValueChanged<int> selectedId;

  const ThemeDropDownButton({super.key, required this.selectedId});

  @override
  State<ThemeDropDownButton> createState() => _ThemeDropDownButtonState();
}

class _ThemeDropDownButtonState extends State<ThemeDropDownButton> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is ThemeSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 300,
              height: 70,
              child: DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // Add more decoration..
                ),
                hint: const Text(
                  'Mavzuni tanlang',
                  style: TextStyle(fontSize: 14),
                ),
                items: state.themeModel.results
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
                    selectedIndex = state.themeModel.results
                        !.indexWhere((element) => element.name == value);
                    widget.selectedId(selectedIndex+1);
                  });
                  print(selectedIndex);
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
        if (state is ThemeErrorState) {
          return const Center(
            child: Text("error"),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
