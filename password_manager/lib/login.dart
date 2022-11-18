import 'package:flutter/material.dart';
import 'package:password_manager/adminTop.dart';
import 'package:password_manager/screens/forgotpassword.dart';
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

 bool _isvisible = false;
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ユーザー名',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: !_isvisible,
                decoration:  InputDecoration(
                    suffixIcon: IconButton(
                    onPressed: (() {
                      setState(() {
                        _isvisible = !_isvisible;
                      });
                    }),
                    icon: _isvisible ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'パスワード',
              
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
              },
              child: const Text('パスワードを忘れた?'),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('ログイン'),
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminScreen(title: 'Admin Screen')) );
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
