import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case/core/consts/constants.dart';
import 'package:flutter_case/core/state/AppStates.dart';
import 'package:flutter_case/features/userList/viewModel/userList_cubit.dart';
import 'package:flutter_case/features/userList/viewModel/userList_repository.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

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
          title: const Text("Kullanıcı Listesi"),
          centerTitle: true,
        ),
        body: BlocConsumer<UserListCubit, AppStates>(
          builder: (context, state) {
            if (state is AppLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AppSuccess) {
              return ListView.builder(
                itemCount: state.userListResponse.length,
                itemBuilder: (context, index) {
                  return  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppConstants.colorBlue,
                         backgroundImage: NetworkImage(state.userListResponse[index].data![index].avatar.toString()),
                      ),
                      title: Text(state.userListResponse[index].data![index].firstName.toString()),
                      subtitle: Text(state.userListResponse[index].data![index].email.toString()),
                    ),
                  );
                },
              );
            } else if (state is AppInitial) {
              return _buildFloating(context);
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
        ),
      ),
    );
  }
}

Widget _buildFloating(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right:AppConstants.padding8,bottom: AppConstants.padding8),
    child: Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton.extended(
          label: const Text("Listeyi Getir"),
          onPressed: () {
            context.read<UserListCubit>().getList();
          }),
    ),
  );
}
