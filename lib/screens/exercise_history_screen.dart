import 'package:flutter/material.dart';

class ExerciseHistoryScreen extends StatefulWidget {
  const ExerciseHistoryScreen({super.key});

  @override
  State<ExerciseHistoryScreen> createState() => _ExerciseHistoryScreenState();
}

class _ExerciseHistoryScreenState extends State<ExerciseHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Text('no data'),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: GestureDetector(
              onTap: () {
                /// route stack logic => 미완
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ],
    );




  }
}
