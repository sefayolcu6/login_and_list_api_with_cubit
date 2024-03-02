import 'package:flutter/material.dart';
import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/models/login/login_model.dart';
import 'package:flutter_case/models/login/login_response.dart';
import 'package:flutter_case/viewmodels/login/login_repository.dart';

class LoginCubit extends Cubit<AppStates> {
  final TextEditingController userNameTextEditingController;
  final TextEditingController passwordTextEditingController;
  bool isLoginFail = false;
  final ILoginService service;
  bool isLoading = false;

  final GlobalKey<FormState> formKey;
  LoginCubit(this.formKey, this.userNameTextEditingController,
      this.passwordTextEditingController,
      {required this.service})
      : super(const AppInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();
      final data = await service.postUserLogin(
        LoginRequestModel(
          email: userNameTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ),

      );
      changeLoadingView();

      if (data is LoginResponseModel) {
        emit(LoginComplete(data));
      }
    } else {
      isLoginFail = true;
      emit(LoginValidateState(isLoading));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }
}
