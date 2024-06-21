import 'dart:convert';

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? verificationCode;


  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.verificationCode
});

  // Model to JSON
  Map<String,dynamic> ToMap(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'phone':phone,
      'password':password,
      'verificationCode':verificationCode
    };
  }
  String toJson()=> json.encode(ToMap());

  // JSON to Model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
      verificationCode: json['verificationCode'] ?? '',
    );
  }

}