
import 'dart:collection';

import 'package:eeducation/DB/Users.dart';
import 'package:eeducation/HomePage.dart';
import 'package:eeducation/Lessons.dart';
import 'package:eeducation/Signup.dart';
import 'package:eeducation/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LogIn extends StatefulWidget {


  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var tfEmail = TextEditingController();
  var tfPassword = TextEditingController();

  var refUsers = FirebaseDatabase(
      databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com")
      .ref()
      .child("Users");


  Future<void> girisYap() async {
    var sorgu1= refUsers.orderByChild("email").equalTo(tfEmail.text);
    var sorgu2= refUsers.orderByChild("password").equalTo(tfPassword.text);

    sorgu1.onValue.listen((event) {
      var gelenDegerler=event.snapshot.value;

      if(gelenDegerler !=null){
        sorgu2.onValue.listen((event) {
          var gelenDegerler2=event.snapshot.value;
          if(gelenDegerler2 != null){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          }
        });
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
          title: Text("Oturum Aç",style: TextStyle(
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(21, 147, 58, 100),
        ),
        body: Column(
          children: [
            Container(
              width: ekranGenisligi/1.1,
              height: ekranYuksekligi/5,
              margin: EdgeInsets.only(left:ekranGenisligi/22),
              child: Icon(
                Icons.lock,
                size: 250,
                color: Color.fromRGBO(21, 147, 58, 100),

              ),
            ),
            Container(
              width: ekranGenisligi/1.1,
              padding: EdgeInsets.fromLTRB(5,2,10,2),
              margin: EdgeInsets.only(top: ekranYuksekligi/6,left: ekranGenisligi/22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                controller: tfEmail,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  border: InputBorder.none,
                  labelText: "Email",
                ),
              ),
            ),
            Container(
              width: ekranGenisligi/1.1,
              margin: EdgeInsets.only(top:ekranYuksekligi/20,left:ekranGenisligi/22),
              padding: EdgeInsets.fromLTRB(5,2,10,2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                controller: tfPassword,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  border: InputBorder.none,
                  labelText: "Şifre",
                ),
              ),
            ),
            Container(
              width: ekranGenisligi/1.1,
              height: ekranYuksekligi/13,
              margin: EdgeInsets.only(top:ekranYuksekligi/24,left:ekranGenisligi/22),
              child: RaisedButton(
                child: Text('Giriş Yap',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,height: 1,
                  ),),
                color: Color.fromRGBO(21, 147, 58, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                onPressed:(){
                  girisYap();
                },
              ),
            ),
            Container(
              width: ekranGenisligi/1.1,
              height: ekranYuksekligi/13,
              margin:EdgeInsets.only(top:ekranYuksekligi/28,left:ekranGenisligi/22),
              child: RaisedButton(
                child: Text('Üye ol',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,height: 1,
                  ),),
                color: Color.fromRGBO(21, 147, 58, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                },
              ),
            ),
          ],
        )
    );
  }
}
