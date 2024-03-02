import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_case/features/userList/viewModel/userList_repository.dart';

class UserListCubit extends Cubit<AppStates>{
  final IUserListRepository _userListRepository;
  UserListCubit(this._userListRepository):super(const AppInitial());


  Future<void> getList()async{
    try {
      emit(const AppLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final response=await _userListRepository.getList();
      emit(AppSuccess(response));
    } catch (e) {
      emit(const AppError("Servis Hatası"));
    }
  }
}