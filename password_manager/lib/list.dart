import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('サービス一覧'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.grey.withOpacity(0.1),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Text(
                      'Google',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: _incrementCounter,
                    ),
                  ),
                ],
              )
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.grey.withOpacity(0.1),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Text(
                      'Microsoft',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: _incrementCounter,
                    ),
                  ),
                ],
              )
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.grey.withOpacity(0.1),
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: const Text(
                      'GitHub',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 100,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: _incrementCounter,
                    ),
                  ),
                ],
              )
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}