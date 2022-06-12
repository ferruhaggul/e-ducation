

import 'package:eeducation/Settings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'DB/Lesson.dart';

class TeacherLessons extends StatefulWidget {
  const TeacherLessons({Key? key}) : super(key: key);

  @override
  State<TeacherLessons> createState() => _LessonsState();
}

class _LessonsState extends State<TeacherLessons> {
  var refLessons=FirebaseDatabase(databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com").ref().child("Lesson");

  var Dersler=["1","2","3","4","5"];
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
  @override
  void initState() {
    tumDersler();
  }

  @override

  Widget build(BuildContext context) {
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
          childAspectRatio: 2/1,
        ),
        itemCount: DerslerCategory.length,
        itemBuilder: (context,indeks){
          return Card(
            color: Color.fromRGBO(224, 224, 224, 1),
            elevation: 10.0,
            shadowColor: Colors.deepPurpleAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
                side: BorderSide(width: 1.8,color: Colors.deepPurpleAccent)
            ),
            child: Column(
              children: [
                Container(
                  child: Text("Dersin adı: ${DerslerName[indeks]}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
                Container(
                  child: Text("Dersin açıklaması: ${DerslerDesc[indeks]}",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),),
                ),
                Container(
                  child: Text("Ders Fiyatı: ${DerslerPrice[indeks]}₺",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
