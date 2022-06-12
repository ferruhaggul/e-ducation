class Lesson{
  late String category;
  late String name;
  late String description;
  late String price;
  late String pdf;
  late String lessonid;


  Lesson(this.lessonid,this.category,this.name,this.description,this.price,this.pdf);

  factory Lesson.fromJson(String key,Map<dynamic,dynamic> json){
    return Lesson(key,json["category"] as String,json["name"] as String, json["description"] as String,
        json["price"] as String,json["pdf"] as String);
  }

}