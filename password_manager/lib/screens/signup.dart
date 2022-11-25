import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
 
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {





  @override
  Widget build(BuildContext context) {
    
    final cnamecontroller = TextEditingController();
    final namecontroller = TextEditingController();
    final passwordcontroller = TextEditingController();

    return Scaffold(
      
      appBar: AppBar(
        
        centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    automaticallyImplyLeading: true,
    title: Text('Sign Up'),
    leading: IconButton(icon:Icon(Icons.arrow_back),
      onPressed:() => Navigator.pop(context, false),
    )
),
      body :  ListView(
          children: <Widget>[
            
                  Container(
                padding: const  EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: cnamecontroller,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  // ignore: prefer_const_constructors
                
                  border: OutlineInputBorder(),
                  labelText: '姓-名',
                 
                ),
                  
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                padding: const  EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: namecontroller,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  // ignore: prefer_const_constructors
                
                  border: OutlineInputBorder(),
                  labelText: 'ユーザー名',
                 
                ),
                  
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:  TextFormField(
                controller: passwordcontroller,
                obscureText: false,
              
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  
                  // ignore: prefer_const_constructors
                  border: OutlineInputBorder(),
                  hintText: 'パスワード',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)
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
                  child: const Text('サインアップ'),
                  onPressed:   () {
                   final cname = cnamecontroller.text;
                   final name = namecontroller.text;
                   final password = passwordcontroller.text;
                   createUser(cname:cname,name:name, password:password);
    
                   Navigator.pop(context);
                  },
                )
            ),
          
          ],
        ));
  
  
  }


}

Future createUser({required String name, required String password, required String cname}) async{
  final docUser = FirebaseFirestore.instance.collection('user-list').doc();
  
  final json = {
    'collectionName': cname,
    'name': name,
    'password': password
  };
  await docUser.set(json);
}