import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ViewScreenState extends StatefulWidget {
  const ViewScreenState({Key? key, required String title,}) : super(key: key);
  @override
  State<ViewScreenState> createState() => _ViewScreenStateState();
}

class _ViewScreenStateState extends State<ViewScreenState> {
 
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final userName = args['userName']!;
    final email = args['email']!; 
    final service = args['service']!;
    final password = args['password']!;
    final adminCheck = args['adminCheck'];

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: ElevatedButton(
            onPressed: () => {
              Navigator.of(context).pushNamed('/list', arguments: {'user': userName, 'adminCheck': adminCheck})
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
        title: const Text(""),

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
      body: 
                   
         Column(children: [
       
              

            Container(
              alignment: Alignment.centerLeft,
              child: 
              const Text(
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
                  color: Colors.black,
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
          Navigator.of(context).pushNamed('/edit',arguments: {'userName': userName, 'serviceName': service, 'adminCheck': adminCheck});
        },
        child: const Text("Edit"),
      ),
    );
  
  }
}