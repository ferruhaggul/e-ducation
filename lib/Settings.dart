

import 'package:eeducation/ProfileSetting.dart';
import 'package:eeducation/Support.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar",style: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,),
       ),
        centerTitle:true,
        backgroundColor: Color.fromRGBO(21, 147, 58, 100),
      ),
      body: Column(
        children: [
          Container(
            width: ekranGenisligi/1.1,
            height: ekranYuksekligi/12.5,
            margin: EdgeInsets.only(top:ekranYuksekligi/4,left: ekranGenisligi/22),
            child: RaisedButton(
              child: Text('Profil Ayarları',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSetting()));

              },
            ),
          ),

          Container(
            width: ekranGenisligi/1.1,
            height: ekranYuksekligi/12.5,
            margin: EdgeInsets.only(top:ekranYuksekligi/28,left: ekranGenisligi/22),
            child: RaisedButton(
              child: Text('Destek',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
              },
            ),
          )
        ],
      ),
    );
  }
}
