import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ServiceRegisterScreen extends StatefulWidget {
  const ServiceRegisterScreen({Key? key}) : super(key: key);
  @override
  State<ServiceRegisterScreen> createState() => _ServiceRegisterScreenState();
}

class _ServiceRegisterScreenState extends State<ServiceRegisterScreen> {
  String? isSelectedItem;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サービス登録'),
      ),
      body: Center(
        child: Column(
          children: [
           Container(
              alignment: Alignment.centerLeft,
              child: const Text(
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
              child: DropdownButton(
                items: const [
                  DropdownMenuItem(
                    child: Text('GitHub'),
                    value: 'GitHub',
                  ),
                  DropdownMenuItem(
                    child: Text('Google'),
                    value: 'Google',
                  ),
                  DropdownMenuItem(
                    child: Text('Microsoft'),
                    value: 'Microsoft',
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    isSelectedItem = value;
                  });
                },
                value: isSelectedItem,
                style: const TextStyle(
                  fontSize: 30,
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
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email address',
                ),
                onChanged: ((Text) => email),
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
                onChanged: (Text) => password,
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
                onPressed: (() {
                  Navigator.pushNamed(context, '/list');
                })
              ),
            ),
          ],
        ),
      ),
    );
  }
}