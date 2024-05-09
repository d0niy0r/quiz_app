import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/customBottomNavBar.dart';
import '../../../rating/presentation/pages/rating.dart';
import '../../../themes_screen/presentation/bloc/theme_bloc.dart';
import '../../../themes_screen/presentation/pages/theme_screen.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, this.startIndex});

  int? startIndex;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.startIndex ?? currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QUIZ APP"),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentIndex,
        children: const <Widget>[
          ThemePage(),
          RatingPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        index: currentIndex,
      ),
    );
  }
}
