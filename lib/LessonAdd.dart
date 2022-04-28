import 'package:eeducation/TeacherLessonAdd.dart';
import 'package:eeducation/TeacherLessonDelete.dart';
import 'package:eeducation/TeacherLessonUpdate.dart';
import 'package:eeducation/TeacherLessons.dart';
import 'package:flutter/material.dart';

class LessonAdd extends StatefulWidget {
  const LessonAdd({Key? key}) : super(key: key);

  @override
  State<LessonAdd> createState() => _LessonAddState();
}

class _LessonAddState extends State<LessonAdd> {

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        title: Text("Ders",style: TextStyle(
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
            height: ekranYuksekligi/13,
            margin: EdgeInsets.only(top:ekranYuksekligi/5,left: ekranGenisligi/22),
            child: RaisedButton(
              child: Text('Derslerim',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLessons()));
              },
            ),
          ),
          Container(
            width: ekranGenisligi/1.1,
            height: ekranYuksekligi/13,
            margin: EdgeInsets.only(top:ekranYuksekligi/28,left:ekranGenisligi/22),
            child: RaisedButton(
              child: Text('Ders Ekleme',
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
               Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLessonAdd()));
              },
            ),
          ),
          Container(
            width: ekranGenisligi/1.1,
            height: ekranYuksekligi/13,
            margin: EdgeInsets.only(top:ekranYuksekligi/28,left:ekranGenisligi/22),
            child: RaisedButton(
              child: Text('Ders Güncelleme',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLessonUpdate()));
              },
            ),
          ),
          Container(
            width: ekranGenisligi/1.1,
            height: ekranYuksekligi/13,
            margin: EdgeInsets.only(top:ekranYuksekligi/28,left:ekranGenisligi/22),
            child: RaisedButton(
              child: Text('Ders Silme',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherLessonDelete()));
              },
            ),
          )
        ],
      ),
    );
  }
}
