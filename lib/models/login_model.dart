import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginToken {
  static String loginToken = '';
}

class LoginRequest {
  Future<LoginResponseModel> loginRequest(String inputNumber) async {
    // mock api에 parameter 대신 input number로 리퀘스트를 판단
    final requestUrl = Uri.parse('https://run.mocky.io/v3/c941cdef-54e8-42d0-b312-0f0f2cbc4881');
    final headers = {'Content-Type': 'application/json; charset=UTF-8'};

    if(inputNumber == '12345') {
      final response = await http.get(requestUrl, headers: headers);

      if(response.statusCode == 200) {
        LoginResponseModel model = LoginResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes))['data']);
        return model;
      } else {
        return LoginResponseModel();
      }
    } else {
      return LoginResponseModel();
    }
  }
}

class LoginResponseModel {
  String? message;
  String? loginToken;

  LoginResponseModel({
    this.message,
    this.loginToken,
  });

  LoginResponseModel.fromJson(dynamic json) {
    message = json['message'] ?? '';
    loginToken = json['login_token'] ?? '';
  }
}