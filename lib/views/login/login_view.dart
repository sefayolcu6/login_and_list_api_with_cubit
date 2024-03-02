import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/core/consts/constants.dart';
import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_case/core/widgets/core_widgets.dart';
import 'package:flutter_case/viewmodels/login/login_cubit.dart';
import 'package:flutter_case/viewmodels/login/login_repository.dart';

import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final String baseUrl = "https://reqres.in/api";
  //https://reqres.in/api
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => LoginCubit(
        formKey,
        _userNameTextEditingController,
        _passwordTextEditingController,
        service: LoginServise(
          Dio(
            BaseOptions(baseUrl: baseUrl),
          ),
        ),
      ),
      child: BlocConsumer<LoginCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppConstants.appBarTitleText),
              centerTitle: true,
              leading:  Center(
                child: Visibility(
                  visible: context.watch<LoginCubit>().isLoading,
                  child:const CircularProgressIndicator(),
                ),
              ),
              elevation: 0,
              backgroundColor: AppConstants.colorTransparent,
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _loginLottie(screenHeight, screenWidth),
                      _loginUserNameTextFormField(state),
                      _heightGap(2),
                      _loginPasswordTextFormField(state),
                      _heightGap(5),
                      _loginButton(screenWidth / 4, context),
                      _forgotPassword(context)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //#region loginLottie
  LottieBuilder _loginLottie(double screenHeight, double screenWidth) {
    return Lottie.asset(AppConstants.loginLottiePath,
        height: screenHeight * 0.4, width: screenWidth * 0.4);
  }
  //#endregion

  //#region loginTextFormField
  TextFormField _loginUserNameTextFormField(AppStates state) {
    return TextFormField(
      autovalidateMode: state is LoginValidateState
          ? (state.isValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled)
          : AutovalidateMode.disabled,
      validator: (value) => (value ?? '').contains(".com")
          ? null
          : "Lütfen geçerli mail adresi girin",
      controller: _userNameTextEditingController,
      focusNode: _userNameFocusNode,
      decoration: InputDecoration(
        label: const Text(AppConstants.userNameTitle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.circular25),
          borderSide: const BorderSide(),
        ),
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      obscureText: false,
    );
  }

  //#endregion
  //#region loginTextFormField
  TextFormField _loginPasswordTextFormField(AppStates state) {
    return TextFormField(
        validator: (value) =>
            (value ?? '').length > 7 ? null : "Yetersiz Şifre",
        autovalidateMode: state is LoginValidateState
            ? (state.isValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled)
            : AutovalidateMode.disabled,
        controller: _passwordTextEditingController,
        focusNode: _passwordFocusNode,
        decoration: InputDecoration(
          label: const Text(AppConstants.passwordTitle),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.circular25),
            borderSide: const BorderSide(),
          ),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.text,
        obscureText: true);
  }
  //#endregion

  //#region loginButton
  Widget _loginButton(double width, BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () {
          context.read<LoginCubit>().postUserModel();
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => const UserList()));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppConstants.colorBlueGrey,
            padding:
                const EdgeInsets.symmetric(vertical: AppConstants.padding15),
            shape: const StadiumBorder()),
        child: const Text(AppConstants.loginButtonText),
      ),
    );
  }
  //#endregion

  //#region forgotPassword
  TextButton _forgotPassword(BuildContext context) {
    return TextButton(
      child: const Text(AppConstants.forgotPassword),
      onPressed: () {
        flushbarWidget(context, AppConstants.tryToRemember, "   ",
            const Duration(seconds: 4));
      },
    );
  }
  //#endregion

//#region heightGap
  Widget _heightGap(double coefValue) {
    return SizedBox(
      height: coefValue * 5,
    );
  }
//#region

//#region widthGap
  Widget _widthGap(double coefValue) {
    return SizedBox(
      width: coefValue * 5,
    );
  }
  //#endregion
}
