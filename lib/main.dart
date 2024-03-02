import 'package:flutter/material.dart';
import 'package:flutter_case/features/login/view/login_view.dart';
// import 'package:flutter_case/features/login/view/login_view.dart';
// import 'package:flutter_case/features/userList/view/userList_view.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home:const LoginView()
    );
  }
}