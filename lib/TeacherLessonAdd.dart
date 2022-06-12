import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'LessonAdd.dart';

class TeacherLessonAdd extends StatefulWidget {
  const TeacherLessonAdd({Key? key}) : super(key: key);

  @override
  State<TeacherLessonAdd> createState() => _TeacherLessonAddState();
}

class _TeacherLessonAddState extends State<TeacherLessonAdd> {
  late String _chosenValue;
  var tfCategory=TextEditingController();
  var tfName=TextEditingController();
  var tfDescription=TextEditingController();
  var tfPrice=TextEditingController();

  var refUsers=FirebaseDatabase(databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com").ref().child("Lesson");

  Future<void> DersEkle(String category,String name, String description, String price) async{
    var bilgi=HashMap<String,dynamic>();
    bilgi["category"]=category;
    bilgi["name"]=name;
    bilgi["description"]=description;
    bilgi["price"]=price;
    bilgi["pdf"]="";
    bilgi["lessonid"]="";
    refUsers.push().set(bilgi);


    Navigator.push(context,MaterialPageRoute(builder: (context) => LessonAdd()));
  }





  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    List<String> items=['Matematik','Fizik','Kimya','Biyoloji'];
    String? SecilenItem='Matematik';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text("Ders Ekleme",style: TextStyle(
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
            width: ekranGenisligi/1.09,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: tfCategory,
              decoration: InputDecoration(
                icon: Icon(Icons.title_outlined),
                border: InputBorder.none,
                labelText: "Kategori",
              ),
            ),
          ),
          Container(
            width: ekranGenisligi/1.09,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: tfName,
              decoration: InputDecoration(
                icon: Icon(Icons.title_outlined),
                border: InputBorder.none,
                labelText: "Ders Adı",
              ),
            ),
          ),

          Container(
            width: ekranGenisligi/1.09,
            height: ekranYuksekligi/4,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: tfDescription,
              decoration: InputDecoration(
                icon: Icon(Icons.description_outlined),
                border: InputBorder.none,
                labelText: "Ders Açıklaması",
              ),
            ),
          ),
          Container(
            width: ekranGenisligi/1.09,
            padding: EdgeInsets.fromLTRB(5,2,10,2),
            margin: EdgeInsets.only(top: ekranYuksekligi/25,left: ekranGenisligi/35),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)
            ),
            child: TextField(
              controller: tfPrice,
              decoration: InputDecoration(
                icon: Icon(Icons.price_change_outlined),
                border: InputBorder.none,
                labelText: "Ders Fiyatı",
              ),
            ),
          ),
          Container(
            width: ekranGenisligi/6,
            height: ekranYuksekligi/14,
            margin:EdgeInsets.only(top:ekranYuksekligi/28),
            child: RaisedButton.icon(onPressed:() {}, icon: Icon(Icons.picture_as_pdf_sharp),color: Colors.redAccent,textColor: Colors.white, label: Text(""),),
            color: Colors.redAccent,
            ),
          Container(
            width: ekranGenisligi/1.09,
            height: ekranYuksekligi/14,
            margin:EdgeInsets.only(top:ekranYuksekligi/28),
            child: RaisedButton(
              child: Text('Ders Ekle',
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
                DersEkle(tfCategory.text, tfName.text, tfDescription.text, tfPrice.text);

              },
            ),
          ),
        ],
      ),

    );
  }
}
