

import 'package:eeducation/Settings.dart';
import 'package:flutter/material.dart';

class TeacherLessons extends StatefulWidget {
  const TeacherLessons({Key? key}) : super(key: key);

  @override
  State<TeacherLessons> createState() => _LessonsState();
}

class _LessonsState extends State<TeacherLessons> {

  var Dersler=["1","2","3","4","5"];

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
        itemCount: Dersler.length,
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
                  child: Text("Ders Başlığı",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                ),
                Container(
                  child: Text("Öğretmen Adı:",style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Container(
                  child: Text("Ders Fiyatı:",style: TextStyle(
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
