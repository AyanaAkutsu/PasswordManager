import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPassword> {
  
  String? password1;
  String? password2;
  String? userName;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold (

      appBar: AppBar(
        
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        automaticallyImplyLeading: true,
        title: Text('パスワードのリセット'),
          leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        )
      ),
  
        body: ListView(
          children: <Widget>[

     

            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'パスワードのリセット',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),

             Container(           
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  TextFormField(
                onChanged: (value) => userName = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ユーザー名',
                ),
                
              ),
            ),


            Container(           
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  TextFormField(
                onChanged: (value) => password1 = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '新しいパスワード',
                ),
                
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                onChanged: (value) => password2 = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'パスワードの確認',
                ),
              ),
            ),
            Container(
                height: 20,
            ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                

                  
                  onPressed: () async{
                    final querySnapshot = await FirebaseFirestore.instance
                      .collection('user-list')
                      .where('name', isEqualTo: userName)
                      .get();
                    final docUsers = querySnapshot.docs.toList();

                    if (querySnapshot.size == 0 || password1 != password2) {
                      return setState(() {
                        count = 1;
                      });
                    } else {
                      FirebaseFirestore.instance.collection('user-list').doc(docUsers[0].id).update({'password': password1});
                    }
                    Navigator.of(context).pushNamed('/');
                  },
                  style: ElevatedButton.styleFrom(
                    //primary: Color.fromARGB(255, 74, 73, 7),
                  ),

                   child: const Text('パスワードをリセットする'),
                  
                )
            ),

            Visibility(
              visible: count == 1,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.3,
                height: 50,
                child: const Text(
                  'ユーザー名かパスワードが間違っています',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  )
              ),
            ),

          ],
        ));
 
  }
}