import 'package:fittrix_coding_test/views/home_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int pageIndex = 0;

  void movePage(int index) {
    setState(() {
      pageIndex = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: MovePageList().pageList.elementAt(pageIndex),
      ),
      bottomNavigationBar: BottomMenu(selectPageCallback: movePage),
    );
  }
}
