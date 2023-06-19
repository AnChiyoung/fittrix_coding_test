import 'package:fittrix_coding_test/views/exercise_record_view.dart';
import 'package:flutter/material.dart';

class ExerciseRecordScreen extends StatefulWidget {
  const ExerciseRecordScreen({super.key});

  @override
  State<ExerciseRecordScreen> createState() => _ExerciseRecordScreenState();
}

class _ExerciseRecordScreenState extends State<ExerciseRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExerciseRecordField(),
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
