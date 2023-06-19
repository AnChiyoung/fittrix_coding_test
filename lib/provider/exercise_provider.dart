import 'package:flutter/material.dart';

class ExerciseProvider with ChangeNotifier {
  int _recordIndex = -1;
  int get recordIndex => _recordIndex;
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  bool _regeditButtonState = false;
  bool get regeditButtonState => _regeditButtonState;

  void selectRecordIndex(int pageIndex, int index) {
    if(index == -1) {
      _pageIndex = pageIndex;
    } else if(index != -1) {
      _recordIndex = index;
      _pageIndex = 1;
    }
    _regeditButtonState = false;
    // index == -1 ? _pageIndex = pageIndex : {_recordIndex = index, _pageIndex = 1};
    notifyListeners();
  }

  void regeditButtonStateChange(bool state) {
    _regeditButtonState = state;
    notifyListeners();
  }
}