import 'dart:convert';
import 'dart:io';

import 'package:flutter_case/models/userList/user_list_model.dart';
// import 'package:flutter_case/features/userList/model/user_model.dart';
// import 'package:flutter_case/features/userList/model/user_list_modelll.dart';
import 'package:http/http.dart' as http;

abstract class IUserListRepository {
  Future<UserListModel> getList();
}

class SampleUserRepository implements IUserListRepository {
  final baseUrl = "https://reqres.in/api/users?page=1";
  @override
  Future<UserListModel> getList() async {
    final response = await http.get(Uri.parse(baseUrl));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        final parsedResponse = UserListModel.fromJson(jsonBody);
        return parsedResponse;
      default:
        throw NetworkError(response.statusCode.toString(), response.body);
    }
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}
