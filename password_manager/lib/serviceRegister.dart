import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ServiceRegisterScreen extends StatefulWidget {
  const ServiceRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ServiceRegisterScreen> createState() => _ServiceRegisterScreenState();
}

class _ServiceRegisterScreenState extends State<ServiceRegisterScreen> {
  String? isSelectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サービス登録'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.grey.withOpacity(0.1),
              child: const Text(
                'サービス名 :',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
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
            ),
          ],
        ),
      ),
    );
  }
}