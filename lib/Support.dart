import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
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
            width: 330,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.title_outlined),
                border: InputBorder.none,
                labelText: "Sorun Başlığı",
              ),
            ),
          ),
          Container(
            width: 330,
            height: ekranYuksekligi/4,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.description_outlined),
                border: InputBorder.none,
                labelText: "Sorun Açıklama",
              ),
            ),
          ),
          Container(
            width: 350,
            height: 60,
            margin:EdgeInsets.only(top:ekranYuksekligi/28),
            child: RaisedButton(
              child: Text('Gönder',
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
