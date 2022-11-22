import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
 
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String? userName;
  String? password;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :  ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                padding: const  EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                onChanged: (value) => userName = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ユーザー名',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  TextFormField(
                onChanged: (value) => password = value,
                decoration: const InputDecoration(
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
                  onPressed:   () {
                    if (userName == null || password == null) {
                      return setState(() {
                        count = 1;
                      });
                    }
                    createUser(name: userName!, password: password!);
                    Navigator.of(context).pushNamed('/');
                  },
                  style: ElevatedButton.styleFrom(
                    //primary: const Color.fromARGB(255, 44, 7, 74),
                  ),
                  child: const Text('サインアップ'),
                )
            ),

            Visibility(
              visible: count == 1,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.3,
                height: 50,
                child: const Text(
                  'ユーザー名かパスワードが入力されていません',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  )
              ),
            ),
          
          ],
        ));
  
  
  }


}

Future<void> createUser({required String name, required String password}) async{
  final json = {
    'name': name,
    'password': password,
    'collectionName': name,
  };

  await FirebaseFirestore.instance.collection('user-list').doc().set(json);

  await FirebaseFirestore.instance.collection(name).doc('personal-data').set({'name': name, 'password': password});
  
}