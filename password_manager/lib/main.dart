import 'package:flutter/material.dart';
import 'package:password_manager/serviceRegister.dart';
import 'package:password_manager/view.dart';
import 'list.dart';
import 'userList.dart';

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
      //home: const ServiceRegisterScreen(),
      //home: const ListScreen(),
      //home:  const ViewScreenState(title: 'Flutter Demo Home Page'),
      home: const UserListScreen(),
    );
  }
}