import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


class ServiceRegisterScreen extends StatefulWidget {
  const ServiceRegisterScreen({Key? key}) : super(key: key);
  @override
  State<ServiceRegisterScreen> createState() => _ServiceRegisterScreenState();
}

class _ServiceRegisterScreenState extends State<ServiceRegisterScreen> {
  String? isSelectedItem;
  String? email;
  String? password;
  Map<String, dynamic>? args;
  String? routeLocation;
  int count = 0;
  int adminCheck = 0;

  @override
  Widget build(BuildContext context) {

    if (args == null) {
      args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      routeLocation = args?['user'] as String;
      adminCheck = args?['adminCheck'] as int;
    }
    
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/list', arguments: {'user': routeLocation, 'adminCheck': adminCheck})
            }, 
            child: const Text(
              "戻る"
            ),

            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 12,
              ),
              primary: Colors.lightBlue,
              side: const BorderSide(
                color: Colors.white,
                width: 2
              )
            ),
          ),
        ),
        centerTitle: true,
        title: const Text('サービス登録'),

        automaticallyImplyLeading: false,

        actions: [
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/')
            }, //ログイン画面に遷移する
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 20,
              ),
              primary: Colors.lightBlue,
              side: const BorderSide(
                color: Colors.white,
                width: 2
              )
            ), 
            child: const Text(
              'ログアウト',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
           Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'サービス名 :',
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
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                  .collection('service-list')
                  .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('エラーが発生しました');
                  }
                  if (!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  final lists = snapshot.requireData.docs
                    .map<String> ((DocumentSnapshot document) {
                       final servicename = document.get('service-name');
                      return servicename as String;
                  }).toList();

                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 50,
                      child: DropdownButton<String>(
                        value: isSelectedItem,
                        items: lists
                        .map((String list) =>
                          DropdownMenuItem(value: list, child: Text(
                            list,
                            style: TextStyle(color: Colors.black),)))
                        .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            isSelectedItem = value;
                          });
                        },
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      )
                    );
                },
                )
            ),
            const SizedBox(
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
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blue)
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your Email address',
                ),
                onChanged: (Text) => email = Text,
              ),
            ),
            const SizedBox(
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
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blue)
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                onChanged: (Text) => password = Text,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  elevation: 15,
                ),
                onPressed: (() async{
                  if (email == null || password == null || isSelectedItem == null) {
                    return setState(() {
                      count = 1;
                    });
                  }
                  await FirebaseFirestore.instance
                    .collection(routeLocation!)
                    .doc()
                    .set({'service-name': isSelectedItem, 'email': email, 'password': password});
                  Navigator.pushNamed(context, '/list', arguments: {'user': routeLocation, 'adminCheck': adminCheck});
                }),
                child: const Text('登録')
              ),
            ),
            Visibility(
              visible: count == 1,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 1,
                height: 50,
                child: const Text(
                  '記入していない欄があります',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}