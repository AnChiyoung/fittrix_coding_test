import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  bool _loginButtonState = false;
  bool get loginButtonState => _loginButtonState;

  void loginButtonStateChange(bool state) {
    _loginButtonState = state;
    notifyListeners();
  }
}