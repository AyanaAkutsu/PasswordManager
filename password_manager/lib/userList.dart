import 'dart:html';

import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key, required String title}) : super(key: key);
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  List user = [
    '佐藤　迅',
    '山田　太郎',
    '田中　太郎',
    '鈴木　太郎',
    '後藤　太郎',
    '山崎　太郎',
    '三島　太郎',
    '浜崎　太郎',
  ];

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),

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
      body: Center(
        child: ListView.builder(
          itemCount: user.length,
          itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 1,
            color: Colors.grey.withOpacity(0.1),
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    user[index],
                    style: TextStyle(fontSize: 30,),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.4,),
                Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: (() {
                      Navigator.pushNamed(context, '/list');
                    })
                  ),
                ),
              ],
            )
          );
          },
        ),
      ), 
    );
  }
}