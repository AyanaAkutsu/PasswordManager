import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required String title,}) : super(key: key);
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  _myDialog (String user) {
    int count = 0;
    showDialog (
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('警告'),
          content: const Text('本当にユーザーを削除しますか？'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async{
                final querySnap1 = await FirebaseFirestore.instance.collection(user).get();
                final querySnap2 = await FirebaseFirestore.instance.collection('user-list').where('collectionName', isEqualTo: user).get();
                for (int i = 0; i < querySnap1.size; i++) {
                  FirebaseFirestore.instance.collection(user).doc(querySnap1.docs[i].id).delete();
                }
                FirebaseFirestore.instance.collection('user-list').doc(querySnap2.docs[0].id).delete();
                Navigator.popUntil(context, (route) => count++ >= 2);
              },
              child: const Text('Yes'),
            )
          ],
      );
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final routeLocation = args['user'] as String;
      final adminCheck = args['adminCheck'] as int;
      


    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
          visible: routeLocation == 'fukaya',
          child: Container(
            child: ElevatedButton(
              onPressed: () => {
                Navigator.of(context).pushNamed('/adminTop')
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
        ),
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
                  .collection(routeLocation)
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
                                  final getDocument = await FirebaseFirestore.instance.collection(routeLocation).where('service-name', isEqualTo: serviceList[index]).get();
                                  final docSnapshot = getDocument.docs.toList();
                                  final email = docSnapshot[0].get('email') as String;
                                  final password = docSnapshot[0].get('password')as String;
                                  Navigator.of(context).pushNamed( '/view', arguments: {'userName': routeLocation, "service": serviceList[index], "email": email, "password": password, "adminCheck": adminCheck});
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
            //ここは管理者画面から来た場合のみ表示
            Visibility(
              visible: adminCheck == 1,
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
                    _myDialog(routeLocation);
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
          Navigator.pushNamed(context, '/serviceRegister',arguments: {'user': routeLocation, 'adminCheck': adminCheck});
        }),
        tooltip: 'サービスを追加',
        child: const Icon(Icons.add),
      ), 
    );
  }
}