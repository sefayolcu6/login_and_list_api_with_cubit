import 'package:flutter_case/models/login/login_response.dart';
import 'package:flutter_case/models/userList/user_list_model.dart';

abstract class AppStates{
  const AppStates();
}

class AppInitial extends AppStates{
  const AppInitial();
}

class AppSuccess extends AppStates{
UserListModel userListResponse;
   AppSuccess(this.userListResponse);
}
class AppLoginSuccess extends AppStates{

   AppLoginSuccess();
}

class AppLoading extends AppStates{
  const AppLoading();
}
class AppError extends AppStates{
  final String errorMessage;
  const AppError(this.errorMessage);
}

class LoginValidateState extends AppStates{
  final bool isValidate;
  const LoginValidateState(this.isValidate);
}
class LoginState extends AppStates{
  final bool isLoading;
  const LoginState(this.isLoading);
}

class LoginComplete extends AppStates{
  final LoginResponseModel model;
  const LoginComplete(this.model);
}


class LoginLoadingState extends AppStates{
  final bool isLoading;
  LoginLoadingState( this.isLoading);
} 