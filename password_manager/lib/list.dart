import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  List service = [
    'GitHub',
    'Google',
    'Microsoft',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
  ];

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
        title: const Text('サービス一覧'),
      ),
      body: Center(
        child: Column (
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.8,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: ListView.builder(
                itemCount: service.length,
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
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            service[index],
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: _incrementCounter,
                          ),
                        ),
                      ],
                    )
                  );
                }
              ),
            ),
            //ここは管理者画面から来た場合のみ表示
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 50,
              child: ElevatedButton(
                child: const Text('ユーザー削除'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.withOpacity(0.8),
                  onPrimary: Colors.white,
                  elevation: 15,
                ),
                onPressed: (() {
                  _counter = 0;
                })
              ),
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