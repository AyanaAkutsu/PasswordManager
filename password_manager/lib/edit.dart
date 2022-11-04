import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key,  required String title}) : super(key: key);
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
                fontSize: 24
              ),
            ),
          ),

          Container(
            child: TextField(),
          ),
        ],
      ),
    );
  }
}