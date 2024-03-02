import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/core/consts/constants.dart';
import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_case/viewmodels/userList/userList_repository.dart';

class UserListCubit extends Cubit<AppStates>{
  final IUserListRepository _userListRepository;
  UserListCubit(this._userListRepository):super(const AppInitial());


  Future<void> getList()async{
    try {
      emit(const AppLoading());
      await Future.delayed(const Duration(milliseconds: AppConstants.milliseconds500));
      final response=await _userListRepository.getList();
      emit(AppSuccess(response));
    } catch (e) {
      emit(const AppError(AppConstants.serviceErrorMessage));
    }
  }
}