import 'dart:html';
import 'package:password_manager/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<MyApp> {
@override
Widget build(BuildContext context){
  return Scaffold(
    body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors:
    [hexStringToColor("CB2B93"),
    hexStringToColor("9546C4"),
    hexStringToColor("5E61F4")
    ],
    begin: Alignment.topCenter, end: Alignment.bottomCenter
    ))
    ),);
    
  
}
}
