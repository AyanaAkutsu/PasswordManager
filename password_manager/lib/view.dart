
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ViewScreenState extends StatefulWidget {
  const ViewScreenState({Key? key, required String title}) : super(key: key);
  @override
  State<ViewScreenState> createState() => _ViewScreenStateState();
}

class _ViewScreenStateState extends State<ViewScreenState> {
  //今は阿久津コレクションを指定していますが、実際は最初にコレクション名を取得します
  
  String? selectedDocument; //前の画面でドキュメント名を取得することを考えています。未実装
  // final  service = getDocument.;//こうしないと、表示するときにエラーになります…
  // String email = ;
  // late String password = getDocument.get('password').toString();

  late Map<String, dynamic> docSnapshot;
    @override
    void initState() {
      super.initState();
      Future(() async {
         final DocumentSnapshot getDocument = await FirebaseFirestore.instance
            .collection('Akutsu-Ayana')
            .doc('hF06TBAPoeqXgd71w6Rc')
            .get();
        
        setState((){
          docSnapshot = getDocument.data() as Map<String, dynamic>;
        });

      });
      
    }
  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Screen"),
        
        actions: [
          ElevatedButton(
            onPressed: () => {}, //ログイン画面に遷移する
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
                docSnapshot['service-name'].toString(),
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
                docSnapshot['email'].toString(),
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
                docSnapshot['password'].toString(),
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
          Navigator.of(context).pushNamed('/edit',arguments: {'userName': 'Sato-Jin', 'serviceName': 'Google'});
        },
        child: const Text("Edit"),
      ),
    );
  
  }
}