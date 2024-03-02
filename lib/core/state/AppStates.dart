import 'package:flutter_case/features/userList/model/user_list_model.dart';

abstract class AppStates{
  const AppStates();
}

class AppInitial extends AppStates{
  const AppInitial();
}

class AppSuccess extends AppStates{
List<UserListModel> userListResponse;
   AppSuccess(this.userListResponse);
}

class AppLoading extends AppStates{
  const AppLoading();
}
class AppError extends AppStates{
  final String errorMessage;
  const AppError(this.errorMessage);
}