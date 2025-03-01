import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/core/consts/constants.dart';
import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_case/models/login/login_response.dart';

import 'package:flutter_case/viewmodels/userList/userList_cubit.dart';
import 'package:flutter_case/viewmodels/userList/userList_repository.dart';

class UserList extends StatefulWidget {
  final LoginResponseModel model;
  const UserList({super.key, required this.model});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserListCubit(SampleUserRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.userList),
          centerTitle: true,
        ),
        body: _bodyWidget(),
      ),
    );
  }
//#region _bodyWidget
 Widget _bodyWidget() {
    return BlocConsumer<UserListCubit, AppStates>(
        builder: (context, state) {
          if (state is AppLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AppSuccess) {
            return ListView.builder(
              itemCount: state.userListResponse.data!.length,
              itemBuilder: (context, index) {
                return  Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppConstants.colorBlue,
                       backgroundImage: NetworkImage(state.userListResponse.data![index].avatar.toString()),
                    ),
                    title: Text(state.userListResponse.data![index].firstName.toString()),
                    subtitle: Text(state.userListResponse.data![index].email.toString()),
                  ),
                );
              },
            );
          } else if (state is AppInitial) {
            return _buildFloatingActionButton(context);
          } else {
            final error = state as AppError;
            return Center(child: Text(error.errorMessage));
          }
        },
        listener: (context, state) {
          if (state is AppError) {
            debugPrint(state.errorMessage);
          }
        },
      );
  }
}
//#endregion

//#region _buildFloatingActionButton
Widget _buildFloatingActionButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right:AppConstants.padding8,bottom: AppConstants.padding8),
    child: Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton.extended(
          label: const Text(AppConstants.getList),
          onPressed: () {
            context.read<UserListCubit>().getList();
          }),
    ),
  );
}
//#endregion