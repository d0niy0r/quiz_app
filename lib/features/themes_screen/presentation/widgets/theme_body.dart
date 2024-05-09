import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../exam/presentation/pages/examScreen.dart';
import '../bloc/theme_bloc.dart';

class ThemeBody extends StatefulWidget {
  const ThemeBody({super.key});

  @override
  State<ThemeBody> createState() => _ThemeBodyState();
}

class _ThemeBodyState extends State<ThemeBody> {
@override
  void initState() {
    context.read<ThemeBloc>().add(GetThemeDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if(state is ThemeSuccessState){
          return Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: state.themeModel.count ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ExamPage(id: state.themeModel.results?[index].id ?? 0,)));
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 80,
                                alignment: Alignment.center,
                                child: Text(
                                  state.themeModel.results?[index].name ?? "",
                                  style:
                                  const TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        if(state is ThemeErrorState){
          return const Center(child: Text("error"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
