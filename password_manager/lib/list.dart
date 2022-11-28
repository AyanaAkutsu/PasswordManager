import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required String title,}) : super(key: key);
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Object? args;
  String? routeLocation;
  

  @override
  Widget build(BuildContext context) {
    if (args == null) {
      args = ModalRoute.of(context)?.settings.arguments;
      routeLocation = args as String;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Service List'),

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
              textStyle: const TextStyle(
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
        child: Column (
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.8,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: StreamBuilder<QuerySnapshot> (
                stream: FirebaseFirestore.instance
                  .collection(routeLocation!)
                  .orderBy('service-name')
                  .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('エラーが発生しました');
                  }
                  if (!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  final serviceList = snapshot.requireData.docs
                    .map<String> ((DocumentSnapshot document) {
                      final servicename = document.get('service-name');
                      return servicename as String;
                  }).toList();

                  return ListView.builder(
                    itemCount: serviceList.length,
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
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: const EdgeInsets.only(left: 35),
                              child: Text(
                                serviceList[index],
                                style: const TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: const EdgeInsets.only(right: 25),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                onPressed: (() async{
                                  final getDocument = await FirebaseFirestore.instance.collection(routeLocation!).where('service-name', isEqualTo: serviceList[index]).get();
                                  final docSnapshot = getDocument.docs.toList();
                                  final email = docSnapshot[0].get('email') as String;
                                  final password = docSnapshot[0].get('password')as String;
                                  Navigator.of(context).pushNamed( '/view', arguments: {'userName': routeLocation, "service": serviceList[index], "email": email, "password": password});
                                })
                              ),
                            ),
                          ],
                        )
                      );
                    }
                  );
                }
                )
            ),
            //ここは管理者画面から来た場合のみ表示(未実装)
            Visibility(
              visible: false,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.withOpacity(0.8),
                    onPrimary: Colors.white,
                    elevation: 15,
                  ),
                  onPressed: (() {
                    
                  }),
                  child: const Text('ユーザー削除')
                ),
              ),
            )
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ((){
          Navigator.pushNamed(context, '/serviceRegister',arguments: routeLocation as String);
        }),
        tooltip: 'サービスを追加',
        child: const Icon(Icons.add),
      ), 
    );
  }
}