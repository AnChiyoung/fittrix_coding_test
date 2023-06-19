import 'package:fittrix_coding_test/provider/exercise_provider.dart';
import 'package:fittrix_coding_test/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Consumer<ExerciseProvider>(
          builder: (context, data, child) {
            return MovePageList().pageList.elementAt(data.pageIndex);
          }
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
