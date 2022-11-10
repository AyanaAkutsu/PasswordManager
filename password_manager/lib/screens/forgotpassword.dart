import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPassword> {
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
                  'パスワードのリセット',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                padding: const  EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  labelText: 'メールアドレス',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  const TextField(
            
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '新しいパスワード',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: const TextField(
              
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
                  
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 74, 73, 7),
                  ),
                   child: const Text('パスワードをリセットする'),
                  
                )
            ),
            
          ],
        )));
 
  }
}