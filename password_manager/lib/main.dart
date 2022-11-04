import 'package:flutter/material.dart';
import 'package:password_manager/edit.dart';
import 'package:password_manager/view.dart';
import 'list.dart';

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
      home:  const EditScreen(title: 'Flutter Demo Home Page'), 
    );
  }
}
