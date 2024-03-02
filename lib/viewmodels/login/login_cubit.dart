import 'package:flutter/material.dart';
import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/viewmodels/login/login_repository.dart';

class LoginCubit extends Cubit<AppStates>{
  
  final TextEditingController userNameTextEditingController ;
  final TextEditingController passwordTextEditingController;
  bool _isLoginFail=false;
  final ILoginService service;
  bool isLoading=false;

final GlobalKey<FormState> formKey;
 LoginCubit(this.formKey, this.userNameTextEditingController, this.passwordTextEditingController, {required this.service}):super(const AppInitial());

 Future<void> postUserModel() async {
  if (formKey.currentState!=null && formKey.currentState!.validate()) {
    print("a");
    changeLoadingViev();
    await Future.delayed(Duration(seconds: 2));
    changeLoadingViev();
  } else {
    debugPrint("a");
    _isLoginFail=true;
    emit(LoginValidateState(_isLoginFail));
  }
 }
 void changeLoadingViev(){
  isLoading=!isLoading;
  emit(LoginLoginState(isLoading));
 }
}