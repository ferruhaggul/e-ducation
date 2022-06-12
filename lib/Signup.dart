import 'dart:collection';

import 'package:eeducation/Login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}


class _SignupState extends State<Signup> {
  bool TeacherSignUp = true;

  var tfName=TextEditingController();
  var tfTc=TextEditingController();
  var tfEmail=TextEditingController();
  var tfPassword =TextEditingController();
  var tfIban = TextEditingController();

  var refUsers=FirebaseDatabase(databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com").ref().child("Users");

  Future<void> kisiEkle(String name,String tc, String email, String password, String iban) async{
    var bilgi=HashMap<String,dynamic>();
    bilgi["name"]=name;
    bilgi["tc"]=tc;
    bilgi["email"]=email;
    bilgi["password"]=password;
    bilgi["iban"]=iban;
    bilgi["userid"]="";
    refUsers.push().set(bilgi);

    
    Navigator.push(context,MaterialPageRoute(builder: (context) => LogIn()));
  }


  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text("Üye Ol",style: TextStyle(
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
            padding: EdgeInsets.only(top:ekranYuksekligi/30),
            margin: EdgeInsets.only(left: ekranGenisligi/22),

          ),
          Container(
            width: ekranGenisligi/1.1,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/40,left: ekranGenisligi/22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: tfName,
              decoration: InputDecoration(
                icon: Icon(Icons.abc),
                border: InputBorder.none,
                labelText: "İsim",
              ),
            ),
          ),
          Container(
            width: ekranGenisligi/1.1,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/22),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: tfTc,
              decoration: InputDecoration(
                icon: Icon(Icons.format_list_numbered_sharp),
                border: InputBorder.none,
                labelText: "T.C.",
              ),
            ),
          ),
          Container(
            width: ekranGenisligi/1.1,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/22),
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
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/22),
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
          Visibility(
            visible: TeacherSignUp,
            child: Container(
              width: ekranGenisligi/1.1,
              padding: EdgeInsets.fromLTRB(5,2,10,2),
              margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)
              ),
              child: TextField(
                controller: tfIban,
                decoration: InputDecoration(
                  icon: Icon(Icons.credit_card),
                  border: InputBorder.none,
                  labelText: "IBAN",
                ),
              ),
            ),
          ),

          Container(
            width: ekranGenisligi/1.1,
            height: ekranYuksekligi/13,
            margin:EdgeInsets.only(top:ekranYuksekligi/25,left: ekranGenisligi/22),
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
                kisiEkle(tfName.text,tfTc.text,tfEmail.text,tfPassword.text,tfIban.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
