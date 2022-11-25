import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required String title}) : super(key: key);
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String? isSelectedItem;
  String? email;
  String? password;
  String? docId;
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final userName = args['userName']!;
    final serviceName = args['serviceName']!;;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Screen"),

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
              "ログアウト"
            ),
          )
        ],
        
      ),

      body: SingleChildScrollView (
        reverse: true,
        child: StreamBuilder<QuerySnapshot> (
          stream: FirebaseFirestore.instance
            .collection(userName)
            .where('service-name', isEqualTo: serviceName)
            .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('エラーが発生しました');
            }
            if (!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
            final service = snapshot.requireData.docs.toList();
            email = service[0].get('email');
            password = service[0].get('password');
            docId = service[0].id;

            return Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "登録内容を編集",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                const SizedBox(
                    width: double.infinity,
                    height: 50,
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "メールアドレス：", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.blue)
                    ),
                  child: TextField(
                    controller: TextEditingController(text: email),
                    decoration: const InputDecoration(
                        hintText: 'Enter your Email address',
                      ),
                      onChanged: (text) => email = text,
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
                  margin: EdgeInsets.only(bottom: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.blue)
                  ),
                  child: TextField(
                    controller: TextEditingController(text: password),
                    decoration: const InputDecoration(
                      hintText: 'Enter your password',
                    ),
                    onChanged: (text) => password = text,
                  ),
                ),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      elevation: 15,
                    ),
                    onPressed: (() async{
                      await FirebaseFirestore.instance
                        .collection(userName)
                        .doc(docId)
                        .set({'service-name': serviceName, 'email': email, 'password': password});
                      Navigator.of(context).pushNamed('/view', arguments: {'userName': userName, "service": serviceName, "email": email, "password": password});
                    }),
                    child: const Text('確定')
                  ),
                ),
              ],
            );
          }

        )
      )
    );
  }
}