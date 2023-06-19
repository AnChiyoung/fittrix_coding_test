import 'package:fittrix_coding_test/constants/login_guide.dart';
import 'package:fittrix_coding_test/constants/validate.dart';
import 'package:fittrix_coding_test/models/login_model.dart';
import 'package:fittrix_coding_test/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginAndOutField extends StatelessWidget {
  const LoginAndOutField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, data, child) {
        if(data.loginState == true) {
          return LogoutField();
        } else if(data.loginState == false) {
          return const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginInputField(),
              SizedBox(height: 4.0),
              LoginInputFieldValidate(),
              SizedBox(height: 4.0),
              LoginButton(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class LoginInputField extends StatefulWidget {
  const LoginInputField({super.key});

  @override
  State<LoginInputField> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {

  TextEditingController loginFieldController = TextEditingController();
  FocusNode loginFieldFocusNode = FocusNode();
  bool buttonState = false;
  String inputNumber = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, data, child) {
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
              maxLength: 5,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                counterText: '',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: data.validateContent.isEmpty ? const Color(0xFF3E97FF) : Colors.red, width: 1)),
                focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1)),
                errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1)),
                filled: true,
                fillColor: const Color(0xFFF6F6F6),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                alignLabelWithHint: false,
                labelText: '로그인 번호',
                labelStyle: TextStyle(fontSize: 12, color: data.validateContent.isEmpty ? const Color(0xFF3E97FF) : Colors.red, fontWeight: FontWeight.w500),
                hintText: '로그인 번호를 입력해 주세요',
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if(TextFieldValidate().isNumericUsingRegularExpression(value.toString()) == false && value!.isNotEmpty) {
                  context.read<LoginProvider>().loginInputFieldValidateChange('숫자만 입력해 주세요', '');
                } else {
                  if(value!.length > 4) {
                    context.read<LoginProvider>().loginInputFieldValidateChange('', loginFieldController.text);
                  } else if(value.isEmpty){
                    context.read<LoginProvider>().loginInputFieldValidateChange('', '');
                  } else {
                    context.read<LoginProvider>().loginInputFieldValidateChange('5자리의 숫자를 입력해 주세요', '');
                  }
                }
              }
          ),
        );
      }
    );
  }
}

class LoginInputFieldValidate extends StatelessWidget {
  const LoginInputFieldValidate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (context, data, child) {
        if(data.validateContent.isEmpty) {
          return const SizedBox.shrink();
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(data.validateContent, style: const TextStyle(fontSize: 10, color: Colors.red))),
          );
        }
      }
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
    return Consumer<LoginProvider>(
      builder: (context, data, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
            onPressed: () async {
              /// button disable
              if(data.loginButtonState == false) {
              }
              /// button enable
              else if(data.loginButtonState == true) {
                LoginResponseModel model = await LoginRequest().loginRequest(data.loginInputNumber);
                /// login fail
                if(model.loginToken == null) {
                  print('login fail');
                }
                /// login success
                else {
                  LoginToken.loginToken = model.loginToken!;
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return LoginGuide(loginState: true);
                    },
                  );
                  context.read<LoginProvider>().logintStateChange(true);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 1.0,
              backgroundColor: data.loginButtonState == false ? Colors.grey : Colors.blue,
              textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 55.0,
              child: const Center(
                child: Text('로그인'),
              ),
            ),
          ),
        );
      }
    );
  }
}

class LogoutField extends StatefulWidget {
  const LogoutField({Key? key}) : super(key: key);

  @override
  State<LogoutField> createState() => _LogoutFieldState();
}

class _LogoutFieldState extends State<LogoutField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {
          LoginToken.loginToken = '';
          context.read<LoginProvider>().logintStateChange(false);
        },
        style: ElevatedButton.styleFrom(
          elevation: 1.0,
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 55.0,
          child: const Center(
            child: Text('로그아웃'),
          ),
        ),
      ),
    );
  }
}
