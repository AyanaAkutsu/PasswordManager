import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'サービス一覧'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.yellow,
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    child: const Text('GitHub'),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.android),
                      onPressed: _incrementCounter,
                    ),
                  )
                ],
                )
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.blue,
              margin: EdgeInsets.only(top: 10),
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.yellow,
              margin: EdgeInsets.only(top: 10),
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
