import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {

  var tfName=TextEditingController();
  var tfTc=TextEditingController();
  var tfEmail=TextEditingController();
  var tfPassword =TextEditingController();
  var tfIban = TextEditingController();

  var refUsers=FirebaseDatabase(databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com").ref().child("Users");

  Future<void> kisiGuncelle(String name,String tc, String email, String password, String iban) async {
    var bilgi = HashMap<String, dynamic>();
    bilgi["name"] = name;
    bilgi["tc"] = tc;
    bilgi["email"] = email;
    bilgi["password"] = password;
    bilgi["iban"] = iban;
    refUsers.child("userid").update(bilgi);
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgileri=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgileri.size.height;
    final double ekranGenisligi=ekranBilgileri.size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text("Profil Ayarları",style: TextStyle(
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
                icon: Icon(Icons.password),
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

          Container(
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

          Container(
            width: ekranGenisligi/1.1,
            height: ekranYuksekligi/13,
            margin:EdgeInsets.only(top:ekranYuksekligi/25,left: ekranGenisligi/22),
            child: RaisedButton(
              child: Text('Güncelle',
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
                kisiGuncelle(tfName.text, tfTc.text, tfEmail.text, tfPassword.text, tfIban.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
