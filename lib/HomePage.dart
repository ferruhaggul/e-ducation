import 'package:eeducation/Baskets.dart';
import 'package:eeducation/LessonAdd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Lessons.dart';
import 'Settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var SayfaListesi=[Lessons(),LessonAdd(),Baskets(),Settings()];
  int secilenIndeks=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.book),
            label:"Dersler",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.add),
            label:"Ders Ekle",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.shopping_bag_outlined),
            label:"Sepet",
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings),
            label:"Ayarlar",
          ),
        ],
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Color.fromRGBO(21, 147, 58, 100),
        currentIndex: secilenIndeks,
        onTap: (indeks){
          setState(() {
            secilenIndeks=indeks;
          });

        },
      ),

    );
  }
}
