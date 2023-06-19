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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {


          if(index == 0) {

          } else {
            widget.selectPageCallback(index);
            pageIndex = index;
          }

        },
      ),
    );
  }

  List<BottomNavigationBarItem> bottomNavigationMenu = [
    const BottomNavigationBarItem(icon: ExerciseRecordPopupButton(), label: '운동 기록 하기'),
    BottomNavigationBarItem(icon: BottomNavigationTextItem(title: '운동 기록 보기'), label: '운동 기록 보기'),
    BottomNavigationBarItem(icon: BottomNavigationTextItem(title: '로그인'), label: '로그인'),
  ];
}

class ExerciseRecordPopupButton extends StatefulWidget {
  const ExerciseRecordPopupButton({super.key});

  @override
  State<ExerciseRecordPopupButton> createState() => _ExerciseRecordPopupButtonState();
}

class _ExerciseRecordPopupButtonState extends State<ExerciseRecordPopupButton> {

  double bottomHeight = -100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: PopupMenuButton(
        offset: Offset(15.0, bottomHeight),
        itemBuilder: (_) {
          return [
            popupItemRow('런지'),
            popupItemRow('스쿼트'),
            popupItemRow('푸시업'),
            popupItemRow('레그 레이즈'),
          ];
        },
        icon: Text('운동 기록 하기'),
      ),
    );
  }

  PopupMenuItem popupItemRow(String title) {
    return PopupMenuItem<String>(
      child: Text(title),
    );
  }
}

class BottomNavigationTextItem extends StatelessWidget {
  String? title;
  BottomNavigationTextItem({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title!);
  }
}

