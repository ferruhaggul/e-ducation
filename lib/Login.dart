
import 'package:eeducation/HomePage.dart';
import 'package:eeducation/Lessons.dart';
import 'package:eeducation/Signup.dart';
import 'package:eeducation/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {


  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
