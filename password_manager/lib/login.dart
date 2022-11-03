import 'package:flutter/material.dart';
import 'package:password_manager/screens/signup.dart';


 

 
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
 
  static const String _title = 'Password Manager';
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => Login();
}
 
class Login extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ようこそ',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
              
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ユーザー名',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'パスワード',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('パスワードを忘れた?'),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('ログイン'),
                  onPressed: () {
                   
                  },
                )
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  const Text('アカウント持ってない場合：'),
                  TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                    
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
            )
          ],
        ));
  }
}
