import 'dart:convert';
import 'dart:io';

import 'package:flutter_case/features/userList/model/user_list_model.dart';
import 'package:http/http.dart' as http;

abstract class IUserListRepository {
  Future<List<UserListModel>> getList();
}

class SampleUserRepository implements IUserListRepository {
  final baseUrl = "https://reqres.in/api/users?page=1";
  @override
  Future<List<UserListModel>> getList() async {
    final response = await http.get(Uri.parse(baseUrl));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body) ;
        return jsonBody.map((e) => UserListModel.fromJson(e)).toList();
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