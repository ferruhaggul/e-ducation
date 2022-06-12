

import 'package:eeducation/DB/Basket.dart';
import 'package:eeducation/Settings.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Baskets extends StatefulWidget {
  const Baskets({Key? key}) : super(key: key);

  @override
  State<Baskets> createState() => _LessonsState();
}

class _LessonsState extends State<Baskets> {

  var refBasket=FirebaseDatabase(databaseURL: "https://e-education-46dea-default-rtdb.firebaseio.com").ref().child("Basket");
  var Dersler=["1","2","3","4","5"];
  List<String> DerslerName =[];
  List<String> DerslerPrice =[];
  Future<void> tumSepet() async {
    refBasket.onValue.listen((event) {
      var gelenDegerler = event.snapshot.value as dynamic;
      List<String> gelenName = [];
      List<String> gelenPrice = [];
      if (gelenDegerler != null) {
        gelenDegerler.forEach((key, nesne) {
          setState(() {
            var gelenDers = Basket.fromJson(key, nesne);
            print("********************");
            gelenName.add(gelenDers.name);
            gelenPrice.add(gelenDers.price);
          });
        });
        DerslerName = gelenName;
        DerslerPrice = gelenPrice;
      }
    });
  }

  @override
  void initState() {
    tumSepet();
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
        itemCount: DerslerName.length,
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
                    fontSize: 25,
                  ),),
                ),
                Container(
                  child: Text("Ders fiyati: ${DerslerPrice[indeks]}₺",style: TextStyle(
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
