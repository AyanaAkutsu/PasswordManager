import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key, required String title}) : super(key: key);
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List bottun = [
    '(管理用)社員一覧',
    '(管理用)社員登録',
    '(自分用)サービス一覧',
  ];

  List destination = [
    '/userList',
    '/signup', 
    '/list',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Admin Top'),

        automaticallyImplyLeading: false,

        actions: [
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/')
            }, //ログイン画面に遷移する
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
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: ListView.builder(
            itemCount: bottun.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 50,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                child: ElevatedButton(
                  child: Text(
                    bottun[index],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    elevation: 15,
                  ),
                  onPressed: (() {
                    Navigator.of(context).pushNamed(destination[index], arguments: {'user': 'fukaya', 'adminCheck': 0});
                  })
                ),
              );
            },
          )
        ), 
      ),
    );
  }
}