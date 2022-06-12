class Basket{
  late String name;
  late String price;
  late String basketid;

  Basket(this.basketid,this.name,this.price);

  factory Basket.fromJson(String key,Map<dynamic,dynamic> json){
    return Basket(key,json["name"] as String, json["price"] as String);
  }
}