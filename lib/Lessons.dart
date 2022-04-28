

import 'package:eeducation/Settings.dart';
import 'package:flutter/material.dart';

class Lessons extends StatefulWidget {
  const Lessons({Key? key}) : super(key: key);

  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {

  var Dersler=["Matematik1","Matematik2","Matematik3","Matematik4","Matematik5"];

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
        itemCount: Dersler.length,
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
                  child: Text("Ders Başlığı",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),),
                ),
                Container(
                  child: Text("Ders Açıklaması",style: TextStyle(
                    fontWeight: FontWeight.w400,
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
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left:ekranGenisligi/2,top: ekranYuksekligi/4),
                      child: FloatingActionButton(
                        child: Icon(Icons.picture_as_pdf_sharp),
                        backgroundColor: Colors.redAccent,
                        onPressed: (){
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:ekranGenisligi/20,top: ekranYuksekligi/4),
                      child: FloatingActionButton(
                        child: Icon(Icons.shopping_bag_outlined),
                        onPressed: (){

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
