import 'package:flutter_case/models/userList/user_list_model.dart';
// import 'package:flutter_case/features/userList/model/user_list_modelll.dart';

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
class LoginLoginState extends AppStates{
  final bool isLoading;
  const LoginLoginState(this.isLoading);
}