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
        Container(),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ],
    );
  }
}
