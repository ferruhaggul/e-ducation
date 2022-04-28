import 'package:flutter/material.dart';

class PasswordChanging extends StatefulWidget {
  const PasswordChanging({Key? key}) : super(key: key);

  @override
  State<PasswordChanging> createState() => _PasswordChangingState();
}

class _PasswordChangingState extends State<PasswordChanging> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgileri=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgileri.size.height;
    final double ekranGenisligi=ekranBilgileri.size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text("Şifre Ayarları",style: TextStyle(
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
            width: 330,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                border: InputBorder.none,
                labelText: "Eski Şifre",
              ),
            ),
          ),
          Container(
            width: 330,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                border: InputBorder.none,
                labelText: "Yeni şifre",
              ),
            ),
          ),
          Container(
            width: 330,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.password),
                border: InputBorder.none,
                labelText: "Yeni şifre Tekrar",
              ),
            ),
          ),
          Container(
            width: 350,
            height: 60,
            margin:EdgeInsets.only(top:ekranYuksekligi/25),
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
