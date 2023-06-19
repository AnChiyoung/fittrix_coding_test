import 'package:fittrix_coding_test/screens/exercise_history_screen.dart';
import 'package:fittrix_coding_test/screens/exercise_record_screen.dart';
import 'package:fittrix_coding_test/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MovePageList {
  List<Widget> pageList = [
    ExerciseRecordScreen(),
    ExerciseHistoryScreen(),
    LoginScreen(),
  ];
}

class BottomMenu extends StatefulWidget {
  Function selectPageCallback;
  BottomMenu({super.key, required this.selectPageCallback});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  late int pageIndex;

  @override
  void initState() {
    pageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        elevation: 0.0,
        items: bottomNavigationMenu,
        currentIndex: pageIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          widget.selectPageCallback(index);
          pageIndex = index;
        },
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationMenu = [
    const BottomNavigationBarItem(icon: SizedBox.shrink(), label: '운동 기록 하기'),
    const BottomNavigationBarItem(icon: SizedBox.shrink(), label: '운동 기록 보기'),
    const BottomNavigationBarItem(icon: SizedBox.shrink(), label: '로그인'),
  ];
}
