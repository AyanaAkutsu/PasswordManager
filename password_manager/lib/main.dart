import 'package:flutter/material.dart';
import 'package:password_manager/edit.dart';
import 'package:password_manager/login.dart';
import 'package:password_manager/serviceRegister.dart';
import 'package:password_manager/view.dart';
import 'list.dart';
import 'userList.dart';
import 'adminTop.dart';
import 'screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => AdminScreen(title: 'Admin Top'),//ログイン画面が完成したらここをログイン画面にする 
        '/edit': (BuildContext context) => EditScreen(title: 'Edit Screen'),
        '/serviceRegister': (BuildContext context) => ServiceRegisterScreen(),
        '/view': (BuildContext context) => ViewScreenState(title: 'View Screen'),
        '/list':(BuildContext context) => ListScreen(title: 'Service List'),
        '/userList':(BuildContext context) => UserListScreen(title: 'User List'),
        '/adminTop':(BuildContext context) => AdminScreen(title: 'Admin Top'),
        '/signup' :(BuildContext context) => SignUpPage(),
      },
    );
  }
}