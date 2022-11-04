import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:password_manager/serviceRegister.dart';
=======
import 'package:password_manager/view.dart';
>>>>>>> fbdb902d82bd867319a3e825a65785415087d362
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
<<<<<<< HEAD
      home: const ServiceRegisterScreen(),
      //home: const ListScreen(),
=======
      home:  const ViewScreenState(title: 'Flutter Demo Home Page'),
>>>>>>> fbdb902d82bd867319a3e825a65785415087d362
    );
  }
}
