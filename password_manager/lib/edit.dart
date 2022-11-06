import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required String title}) : super(key: key);
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String? isSelectedItem;
  String? email = "sss";
  String? password = "qwerty";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Screen"),
        
      ),

      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "登録内容の編集",
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Container(
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
            child: TextField(
              controller: TextEditingController(text: email),
               decoration: const InputDecoration(
                  hintText: 'Enter your Email address',
                ),
                onChanged: ((text) => email),
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
                controller: TextEditingController(text: password),
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                onChanged: (text) => password,
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
                child: const Text('確定'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  elevation: 15,
                ),
                onPressed: (() {
                  Navigator.pushNamed(context, '/list');
                })
              ),
            ),
        ],
      ),
    );
  }
}