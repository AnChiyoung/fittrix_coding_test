import 'package:fittrix_coding_test/constants/login_guide.dart';
import 'package:fittrix_coding_test/models/login_model.dart';
import 'package:fittrix_coding_test/provider/login_provider.dart';
import 'package:fittrix_coding_test/screens/exercise_history_screen.dart';
import 'package:fittrix_coding_test/screens/exercise_record_screen.dart';
import 'package:fittrix_coding_test/screens/login_screen.dart';
import 'package:fittrix_coding_test/screens/video_play_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovePageList {
  List<Widget> pageList = [
    VideoPlayScreen(),
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
    pageIndex = 1;
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
          if(index == 0 || index == 1) {
            if(LoginToken.loginToken.isEmpty) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return LoginGuide(loginState: false);
                  }
              );
            } else {
              widget.selectPageCallback(index);
              pageIndex = index;
              context.read<LoginProvider>().loginButtonStateChange(false, '');
            }
          } else {
            widget.selectPageCallback(index);
            pageIndex = index;
          }
        },
      ),
    );
  }

  void selectRecordType(int index) {
    print(index);
  }

  List<BottomNavigationBarItem> bottomNavigationMenu = [
    BottomNavigationBarItem(icon: ExerciseRecordPopupButton(), label: '운동 기록 하기'),
    BottomNavigationBarItem(icon: BottomNavigationTextItem(title: '운동 기록 보기'), label: '운동 기록 보기'),
    BottomNavigationBarItem(icon: BottomNavigationTextItem(title: '로그인'), label: '로그인'),
  ];
}

enum RecordType {
  exercise01,
  exercise02,
  exercise03,
  exercise04,
}

class ExerciseRecordPopupButton extends StatefulWidget {
  // Function selectCallback;
  ExerciseRecordPopupButton({super.key, });

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
            popupItemRow(RecordType.exercise01.toString()),
            popupItemRow(RecordType.exercise02.toString()),
            popupItemRow(RecordType.exercise03.toString()),
            popupItemRow(RecordType.exercise04.toString()),
          ];
        },
        icon: const Text('운동 기록 하기'),
        onSelected: (value) {
          // widget.selectCallback(value);
        }
      ),
    );
  }

  PopupMenuItem popupItemRow(String title) {
    String setTitle = '';
    if(title == RecordType.exercise01.toString()) {
      setTitle = '런지';
    } else if(title == RecordType.exercise02.toString()) {
      setTitle = '스쿼트';
    } else if(title == RecordType.exercise03.toString()) {
      setTitle = '푸시업';
    } else if(title == RecordType.exercise04.toString()) {
      setTitle = '레그 레이즈';
    }

    return PopupMenuItem<String>(
      value: title,
      child: Text(setTitle),
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

