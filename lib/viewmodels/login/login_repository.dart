import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_case/models/login/login_model.dart';
import 'package:flutter_case/models/login/login_response.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
}

class LoginServise extends ILoginService {
  LoginServise(super.dio);
  final String _url='https://reqres.in/api/login';

  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    final response = await dio.get(_url, data: model);

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
