import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => Login();
}
 
class Login extends State<MyStatefulWidget> {

  String? userName;
  String? password;
  int count = 0;
  bool _isvisible = false;
  static const String _title = 'Password Manager';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: MaterialApp(
        title: _title,
      
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(_title)),
          body: Padding(
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
                  onChanged: (value) => userName = value,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                margin: const EdgeInsets.only(bottom: 10),
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
                onChanged: (value) => password = value,
                ),
              ),
              Visibility(
                visible: count == 1,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 50,
                  child: const Text(
                    'ユーザー名かパスワードが間違っています',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                    )
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                   Navigator.of(context).pushNamed('/forgotPassword');
                },
                child: const Text('パスワードを忘れた?'),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    child: const Text('ログイン'),
                    onPressed: () async{
    
                      
                      final querySnap = await FirebaseFirestore.instance
                        .collection('user-list')
                        .where('name', isEqualTo: userName)
                        .get();
                      
                      if (querySnap.size == 0) {
                        return setState(() {
                          count = 1;
                        });
                      }
    
                      final docQuerySnap = querySnap.docs.toList();
                      final checkPassword = docQuerySnap[0].get('password');
                      final collectionName = docQuerySnap[0].get('collectionName');
                      
                      if (checkPassword != password) {
                        return setState(() {
                          count = 1;
                        });
                      }
                      if (collectionName == 'Fukaya-Takehiro') Navigator.of(context).pushNamed('/adminTop', arguments: collectionName);
                      Navigator.of(context).pushNamed('/list', arguments: collectionName);
                    },
                  )
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('アカウント持ってない場合：'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              )
              )
            ],
          ))
        ),
      ),
    );
  }
  
  }
