import 'package:flutter/material.dart';

class TeacherLessonUpdate extends StatefulWidget {
  const TeacherLessonUpdate({Key? key}) : super(key: key);

  @override
  State<TeacherLessonUpdate> createState() => _TeacherLessonAddState();
}

class _TeacherLessonAddState extends State<TeacherLessonUpdate> {
  late String _chosenValue;
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
        title: Text("Ders Güncelleme",style: TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,

        ),),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(21, 147, 58, 100),

      ),
      body: Column(
        children: [
          Container(
            width: ekranGenisligi/1.06,
            height: ekranYuksekligi/12.5,
            padding: EdgeInsets.only(left: ekranGenisligi/4),
            margin: EdgeInsets.only(left: ekranGenisligi/28,top: ekranYuksekligi/45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: DropdownButton<String>(
              value: SecilenItem,
              items: items
                  .map((item) =>DropdownMenuItem<String>(
                value: item,
                child: Text(item,style: TextStyle(fontSize: 24)),
              )).toList(),
              onChanged: (item) => setState(() => SecilenItem=item),
            ),
          ),
          Container(
            width: ekranGenisligi/1.06,
            height: ekranYuksekligi/12.5,
            padding: EdgeInsets.only(left: ekranGenisligi/4),
            margin: EdgeInsets.only(left: ekranGenisligi/28,top: ekranYuksekligi/45),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black),
            ),
            child: DropdownButton<String>(
              value: SecilenItem,
              items: items
                  .map((item) =>DropdownMenuItem<String>(
                value: item,
                child: Text(item,style: TextStyle(fontSize: 24)),
              )).toList(),
              onChanged: (item) => setState(() => SecilenItem=item),
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
              decoration: InputDecoration(
                icon: Icon(Icons.price_change_outlined),
                border: InputBorder.none,
                labelText: "Ders Fiyatı",
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
              decoration: InputDecoration(
                icon: Icon(Icons.picture_as_pdf_outlined),
                border: InputBorder.none,
                labelText: "PDF",
              ),
            ),
          ),
          Container(
            width: ekranGenisligi/1.09,
            height: ekranYuksekligi/14,
            margin:EdgeInsets.only(top:ekranYuksekligi/28),
            child: RaisedButton(
              child: Text('Ders Güncelle',
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
