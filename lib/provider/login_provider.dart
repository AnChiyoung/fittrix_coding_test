import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool _loginButtonState = false;
  bool get loginButtonState => _loginButtonState;
  String _loginInputNumber = '';
  String get loginInputNumber => _loginInputNumber;

  void loginButtonStateChange(bool state, String inputNumber) {
    _loginButtonState = state;
    inputNumber.isEmpty ? {} : _loginInputNumber = inputNumber;
    notifyListeners();
  }

  bool _loginState = false;
  bool get loginState => _loginState;

  void logintStateChange(bool state) {
    _loginState = state;
    state == true ? _loginButtonState = false : {};
    notifyListeners();
  }
}