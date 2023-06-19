import 'package:flutter/material.dart';

class LoginInputField extends StatefulWidget {
  const LoginInputField({super.key});

  @override
  State<LoginInputField> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {

  TextEditingController loginFieldController = TextEditingController();
  FocusNode loginFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
          controller: loginFieldController,
          autofocus: true,
          focusNode: loginFieldFocusNode,
          readOnly: false,
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.always,
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF3E97FF), width: 1)),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1)),
            errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1)),
            filled: true,
            fillColor: Color(0xFFF6F6F6),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            alignLabelWithHint: false,
            labelText: 'login number',
            labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            hintText: 'input login number',
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
            border: InputBorder.none,
          ),
          validator: (value) {
            // if(value!.isNotEmpty) {
            //   if(SigninValidate().emailValidate(value!) == false) {
            //     emailState = false;
            //     return '이메일 형식을 확인해 주세요';
            //   } else {
            //     emailState = true;
            //     return null;
            //   }
            // } else {
            //   emailState = false;
            //   return null;
            // }
          },
          onChanged: (_) {

          }
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1.0,
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 55,
          child: const Center(
            child: Text('로그인'),
          ),
        ),
      ),
    );
  }
}
