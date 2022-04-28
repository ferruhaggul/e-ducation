import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool TeacherSignUp=true;
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
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  activeColor: Color.fromRGBO(21, 147, 58, 100),
                  inactiveTrackColor: Colors.purple,
                  inactiveThumbColor: Colors.purple,
                  value: TeacherSignUp,
                  onChanged:(veri){
                    setState(() {
                      TeacherSignUp=veri;
                    });
                  }
                ),
              ],
            ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));

              },
            ),
          ),
        ],
      ),
    );
  }
}
