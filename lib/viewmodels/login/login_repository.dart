import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_case/models/login/login_model.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);
  final String loginPath =ILoginServicePath.Login.rawValue;
  Future<LoginRequestModel?> postUserLogin(LoginRequestModel model);
}

enum ILoginServicePath { Login }
extension ILoginServicePathExtension on ILoginServicePath{
  String get rawValue{  
    switch(this){
      case ILoginServicePath.Login:
      return '/login';
  }}
}

class LoginServise extends ILoginService{
  LoginServise(super.dio);

  @override
  Future<LoginRequestModel?> postUserLogin(LoginRequestModel model) async {
    final response=await dio.post(loginPath,data: model);

    if (response.statusCode==HttpStatus.ok) {
      return LoginRequestModel.fromJson(response.data);
    } else {
     return null; 
    }
    }

}