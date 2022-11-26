import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key, required String title}) : super(key: key);
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  String? userName;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/adminTop')
            }, 
            child: const Text(
              "戻る"
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
          ),
        ),
        centerTitle: true,
        title: const Text('User List'),

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
        child: StreamBuilder<QuerySnapshot> (
          stream: FirebaseFirestore.instance
            .collection('user-list')
            .orderBy('name')
            .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('エラーが発生しました');
            }
            if (!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
            final userList = snapshot.requireData.docs
              .map<String> ((DocumentSnapshot document) {

                final name = document.get('name');
                return name as String;

                
             

            }).toList();

            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.grey.withOpacity(0.1),
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.only(left: 35),
                      child: Text(
                        userList[index],
                        style: const TextStyle(fontSize: 30,),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.only(right: 25),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: (() async {
                          final querySnapshot = await FirebaseFirestore.instance
                            .collection('user-list')
                            .where('name', isEqualTo: userList[index])
                            .get();
                          final documents = querySnapshot.docs.toList();
                          userName = documents[0].get('collectionName');
                          Navigator.pushNamed(context, '/list', arguments: userName);
                        })
                      ),
                    ),
                  ],
                )
              );
              },
            );
          }
        )
      ), 
    );
  }
}