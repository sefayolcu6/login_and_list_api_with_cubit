import 'package:flutter/material.dart';
import 'package:flutter_case/core/consts/constants.dart';
import 'package:flutter_case/core/widgets/core_widgets.dart';
import 'package:flutter_case/features/userList/view/userList_view.dart';
import 'package:lottie/lottie.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appBarTitleText),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppConstants.colorTransparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            child: Column(
              children: [
                _loginLottie(screenHeight, screenWidth),
                _loginTextFormField(false, AppConstants.userNameTitle),
                _heightGap(2),
                _loginTextFormField(true, AppConstants.passwordTitle),
                _heightGap(5),
                _loginButton(screenWidth / 4,context),
                _forgotPassword(context)
              ],
            ),
          ),
        ),
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
  TextFormField _loginTextFormField(bool isPasswordArea, String labelText) {
    return TextFormField(
      controller: isPasswordArea
          ? _passwordTextEditingController
          : _userNameTextEditingController,
      focusNode: isPasswordArea ? _passwordFocusNode : _userNameFocusNode,
      decoration: InputDecoration(
        label: Text(labelText),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.circular25),
          borderSide: const BorderSide(),
        ),
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      obscureText: isPasswordArea ? true : false,
    );
  }
  //#endregion

  //#region loginButton
  Widget _loginButton(double width,BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserList()));
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
