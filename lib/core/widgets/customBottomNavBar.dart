import 'package:flutter/material.dart';
import '../styles/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key, required this.currentIndex, required this.index});
  ValueChanged<int> currentIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0B625D),
      selectedItemColor: AppColors.bottomNavSelectColor,
      unselectedItemColor: AppColors.bottomNavUnSelectColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: index,
      onTap: (index){
        currentIndex(index);
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.black,
          icon: Icon(Icons.question_answer_outlined),
          label: "QUESTIONS",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.abc_outlined),
          label: "RATING",
        ),
      ],
    );
  }
}
