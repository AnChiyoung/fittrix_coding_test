import 'package:flutter/material.dart';

class LoginGuide extends StatelessWidget {
  bool loginState;
  LoginGuide({Key? key, required this.loginState}) : super(key: key);

  String content = '';

  @override
  Widget build(BuildContext context) {

    loginState == true ? content = '로그인에 성공하였습니다' : content = '로그인을 먼저 진행해주세요';

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      title: Column(
        children: [
          Align(alignment: Alignment.centerLeft, child: Text(content)),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("확인"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
