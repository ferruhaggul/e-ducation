

import 'dart:collection';

import 'package:eeducation/Settings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'DB/Lesson.dart';

class Lessons extends StatefulWidget {
  const Lessons({Key? key}) : super(key: key);

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  var refLessons=FirebaseDatabase(databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com").ref().child("Lesson");
  var refBasket=FirebaseDatabase(databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com").ref().child("Basket");

  List<String> DerslerCategory =[];
  List<String> DerslerName =[];
  List<String> DerslerDesc =[];
  List<String> DerslerPrice =[];

  Future<void> tumDersler() async {
    refLessons.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      List<String> gelenCategory = [];
      List<String> gelenName = [];
      List<String> gelenDesc = [];
      List<String> gelenPrice = [];
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          setState(() {
            var gelenDers = Lesson.fromJson(key, nesne);
            print("********************");
            gelenCategory.add(gelenDers.category);
            gelenName.add(gelenDers.name);
            gelenDesc.add(gelenDers.description);
            gelenPrice.add(gelenDers.price);
            print(gelenCategory);
          });
        });
        DerslerCategory = gelenCategory;
        DerslerName = gelenName;
        DerslerDesc = gelenDesc;
        DerslerPrice = gelenPrice;
      }
    });
  }
  Future<void> SepeteEkle(String name,String price) async{
    var bilgi=HashMap<String,dynamic>();
    bilgi["name"]=name;
    bilgi["price"]=price;
    bilgi["basketid"]="";
    refBasket.push().set(bilgi);
  }
  @override
  void initState() {
    tumDersler();
  }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text("Dersler",style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(21, 147, 58, 100),
      ),
      body:GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1/1,
        ),
        itemCount: DerslerCategory.length,
        itemBuilder: (context,indeks){
          return Card(
            color: Colors.white70,
            elevation: 10.0,
            shadowColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
              side: BorderSide(width: 1.8,color: Colors.deepPurpleAccent)
            ),
            child: Column(
              children: [
                Container(
                  //margin: EdgeInsets.only(top:1),
                  child: Text("Dersin adı :${DerslerName[indeks]}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                ),
                Container(
                  child: Text("Dersin açıklaması: ${DerslerDesc[indeks]}",style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),),
                ),
                Container(
                  child: Text("Dersin fiyatı: ${DerslerPrice[indeks]}₺",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Container(
                  width: ekranGenisligi/1.1,
                  height: ekranYuksekligi/4,
                  margin: EdgeInsets.only(left:ekranGenisligi/22),
                  child: Icon(
                    Icons.picture_as_pdf,
                    size: 150,
                    color: Color.fromRGBO(21, 147, 58, 100),

                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:ekranGenisligi/2,top: ekranYuksekligi/10000),
                      child: FloatingActionButton(
                        child: Icon(Icons.picture_as_pdf_sharp),
                        backgroundColor: Colors.redAccent,
                        onPressed: (){
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:ekranGenisligi/20,top: ekranYuksekligi/10000),
                      child: FloatingActionButton(
                        child: Icon(Icons.shopping_bag_outlined),
                        onPressed: (){
                          SepeteEkle("${DerslerName[indeks]}","${DerslerPrice[indeks]}");
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
