import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
 
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color.fromARGB(255, 44, 7, 74),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                padding: const  EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ユーザー名',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'パスワード',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const TextField(
                
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'パスワードの確認',
                ),
              ),
            ),
            Container(
                height: 20,
            ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('サインアップ'),
                  onPressed: () {
                   Navigator.pop(context);
                   final name = namecontroller.text;
                   final password = passwordcontroller.text;
                   createUser( name : name);
                   createPassword(password : password);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 44, 7, 74),
                  ),
                  
                )
            ),
            
          ],
        )));

  }
  
 Future createUser({required String name}) async{
  final docUser = FirebaseFirestore.instance.collection('user-list').doc('my-id');

  final json = {
    'user-name' : name,
  };
 }
 
Future createPassword({required String password}) async {
  final docUser = FirebaseFirestore.instance.collection('user-list').doc('my-id');

  final json = {
    'password' : password,
  };
}
}