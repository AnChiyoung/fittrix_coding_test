import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool _loginButtonState = false;
  bool get loginButtonState => _loginButtonState;
  String _loginInputNumber = '';
  String get loginInputNumber => _loginInputNumber;
  String _validateContent = '';
  String get validateContent => _validateContent;
  bool _loginState = false;
  bool get loginState => _loginState;

  void loginInputFieldValidateChange(String validateContent, String inputNumber) {
    inputNumber.isEmpty ? {_validateContent = validateContent, _loginButtonState = false} : {_validateContent = '', _loginInputNumber = inputNumber, _loginButtonState = true};
    notifyListeners();
  }

  void loginButtonStateFalse() {
    _loginButtonState = false;
    _loginInputNumber = '';
    notifyListeners();
  }

  void logintStateChange(bool state) {
    _loginState = state;
    state == true ? _loginButtonState = false : {};
    notifyListeners();
  }
}