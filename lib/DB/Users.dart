class Users{
  late String name;
  late String tc;
  late String email;
  late String password;
  late String iban;
  late String userid;

  Users(this.userid,this.email,this.iban,this.name,this.password,this.tc);

  factory Users.fromJson(String key,Map<dynamic,dynamic> json){
    return Users(key,json["email"] as String,json["iban"] as String, json["name"] as String,
        json["password"] as String,json["tc"] as String);
  }

  }




