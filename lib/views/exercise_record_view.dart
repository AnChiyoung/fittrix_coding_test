import 'package:fittrix_coding_test/provider/exercise_provider.dart';
import 'package:fittrix_coding_test/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseRecordField extends StatefulWidget {
  const ExerciseRecordField({Key? key}) : super(key: key);

  @override
  State<ExerciseRecordField> createState() => _ExerciseRecordFieldState();
}

class _ExerciseRecordFieldState extends State<ExerciseRecordField> {

  String imagePath = '';
  String date = '';
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    date = DateTime.now().year.toString() + DateTime.now().month.toString() + DateTime.now().day.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int selectIndex = context.watch<ExerciseProvider>().recordIndex;

    if(selectIndex == 0) {
      imagePath = '/exercise01.png';
    } else if(selectIndex == 1) {
      imagePath = '/exercise02.jpeg';
    } else if(selectIndex == 2) {
      imagePath = '/exercise03.png';
    } else if(selectIndex == 3) {
      imagePath = '/exercise04.png';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imagePath.isEmpty ? const SizedBox.shrink() : Image.asset('assets/exercise$imagePath', width: double.infinity),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text('현재일자 $date'),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
              controller: descriptionController,
              readOnly: false,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.always,
              maxLines: 1,
              maxLength: 5,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                counterText: '',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3E97FF), width: 1)),
                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1)),
                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1)),
                filled: true,
                fillColor: Color(0xFFF6F6F6),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                alignLabelWithHint: false,
                labelText: '운동 기록 설명',
                labelStyle: TextStyle(fontSize: 12, color: Color(0xFF3E97FF), fontWeight: FontWeight.w500),
                hintText: '운동에 대해 기술해 주세요',
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if(value.isEmpty) {
                  context.read<ExerciseProvider>().regeditButtonStateChange(false);
                } else {
                  context.read<ExerciseProvider>().regeditButtonStateChange(true);
                }
              }
          ),
        ),
        const SizedBox(height: 10.0),
        Consumer<ExerciseProvider>(
          builder: (context, data, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  /// button disable
                  if(data.regeditButtonState == false) {
                  }
                  /// button enable
                  else if(data.regeditButtonState == true) {
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 1.0,
                  backgroundColor: data.regeditButtonState == false ? Colors.grey : Colors.blue,
                  textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 55.0,
                  child: const Center(
                    child: Text('기록하기'),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}