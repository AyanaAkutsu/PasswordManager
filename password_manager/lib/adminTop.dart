import 'dart:html';

import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List bottun = [
    '社員一覧',
    '社員登録',
    'サービス一覧',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('管理者用トップ画面'),
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