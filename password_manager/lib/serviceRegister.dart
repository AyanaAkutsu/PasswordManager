import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  Object? args;
  String? routeLocation;

  List<DocumentSnapshot> docList = [];
  List<String> data =[];

  @override
  Widget build(BuildContext context) {
    if (args == null) {
      args = ModalRoute.of(context)?.settings.arguments;
      routeLocation = args as String;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('サービス登録'),

        actions: [
          ElevatedButton(
            onPressed: () => {}, //ログイン画面に遷移する
            child:  Text(
              'ログアウト',
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
                      final documentData = document.data()! as Map<String, dynamic>;
                      return documentData['service-name']! as String;
                  }).toList();

                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: DropdownButton<String>(
                        value: isSelectedItem,
                        items: lists
                        .map((String list) =>
                          DropdownMenuItem(value: list, child: Text(list)))
                        .toList(),
                        onChanged: (String? value) {
                          setState(() {
                            isSelectedItem = value;
                          });
                        },
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      )
                    );
                },
                )
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
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email address',
                ),
                onChanged: (Text) => email = Text,
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
              margin: EdgeInsets.only(bottom: 30),
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                ),
                onChanged: (Text) => password = Text,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.blue)
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.15,
              height: 50,
              child: ElevatedButton(
                child: const Text('登録'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  elevation: 15,
                ),
                onPressed: (() async{
                  await FirebaseFirestore.instance
                    .collection('Sato-Jin')
                    .doc()
                    .set({'service-name': isSelectedItem, 'email': email, 'password': password});
                  Navigator.pushNamed(context, '/list', arguments: routeLocation as String);
                })
              ),
            ),
          ],
        ),
      ),
    );
  }
}