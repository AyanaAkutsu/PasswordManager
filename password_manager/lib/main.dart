import 'package:flutter/material.dart';
import 'package:password_manager/edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:password_manager/screens/forgotpassword.dart';
import 'firebase_options.dart';
import 'package:password_manager/login.dart';
import 'package:password_manager/serviceRegister.dart';
import 'package:password_manager/view.dart';
import 'list.dart';
import 'userList.dart';
import 'adminTop.dart';
import 'screens/signup.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/':(BuildContext context) => MyStatefulWidget(),
        '/edit': (BuildContext context) => EditScreen(title: 'Edit Screen'),
        '/serviceRegister': (BuildContext context) => ServiceRegisterScreen(),
        '/view': (BuildContext context) => ViewScreenState(title: 'View Screen',),
        '/list':(BuildContext context) => ListScreen(title: 'Service List'),
        '/userList':(BuildContext context) => UserListScreen(title: 'User List'),
        '/adminTop':(BuildContext context) => AdminScreen(title: 'Admin Top'),
        '/signup' :(BuildContext context) => SignUpPage(),
        '/forgotPassword': (BuildContext context) => ForgotPassword(),
      },
    );
  }
}