import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
 
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {





  @override
  Widget build(BuildContext context) {
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();

    return Scaffold(
      body :  ListView(
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
              child: TextFormField(
                controller: namecontroller,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  // ignore: prefer_const_constructors
                
                  border: OutlineInputBorder(),
                  labelText: 'ユーザー名',
                 
                ),
                  
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  TextFormField(
                controller: passwordcontroller,
                obscureText: false,
              
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  
                  // ignore: prefer_const_constructors
                  border: OutlineInputBorder(),
                  hintText: 'パスワード',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)
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
                  onPressed:   () {
                   final name = namecontroller.text;
                   final password = passwordcontroller.text;
                   createUser(name:name, password:password);
    
                   Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 44, 7, 74),
                  ),
                  
                )
            ),
          
          ],
        ));
  
  
  }


}

Future createUser({required String name, required String password}) async{
  final docUser = FirebaseFirestore.instance.collection('user-list').doc();
  
  final json = {
    'user-name': name,
    'password': password
  };
  await docUser.set(json);
}