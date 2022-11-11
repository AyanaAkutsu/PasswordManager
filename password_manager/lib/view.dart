
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ViewScreenState extends StatefulWidget {
  const ViewScreenState({Key? key, required String title}) : super(key: key);
  @override
  State<ViewScreenState> createState() => _ViewScreenStateState();
}
class _ViewScreenStateState extends State<ViewScreenState> {
  String? selectedDocument; //前の画面でドキュメント名を取得することを考えています。未実装
  String service = "";  //こうしないと、表示するときにエラーになります…
  String email = "";
  String password = "";

  _getField() async {
    //今は阿久津コレクションを指定していますが、実際は最初にコレクション名を取得します
    final getDocument = await FirebaseFirestore.instance.collection('Ayana-Akutsu').doc('9BxcgzndZD5yoHw4qodv').get();
    service = getDocument.get('service-name');
    email = getDocument.get('email');
    password = getDocument.get('password');
    
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Screen"),
        
        actions: [
          ElevatedButton(
            onPressed: () => {}, //ログイン画面に遷移する
            child: const Text(
              "ログアウト"
            ),

            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 20,
              ),
              primary: Colors.lightBlue,
              side: const BorderSide(
                color: Colors.white,
                width: 2
              )
            ),
          )
        ],
      ),
      body: Column(children: [
            

            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "サービス名：",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
        
            ),

            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                service,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blue)
              ),
            ),

            Container(
              width: double.infinity,
              height: 80,
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "メールアドレス：",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),

             Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                email,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blue)
              ),
            ),

            Container(
              width: double.infinity,
              height: 80,
            ),

             Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "パスワード：",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                password,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blue)
              ),
            ),
          ],
      
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/edit');
        },
        child: const Text("Edit"),
      ),
    );
  }
}