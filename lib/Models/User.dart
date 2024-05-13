import 'dart:convert';

class User {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;

  User({
    this.name,
    this.email,
    this.phone,
    this.password
});

  // Model to JSON
  Map<String,dynamic> ToMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'password':password
    };
  }
  String toJson()=> json.encode(ToMap());

  // JSON to Model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phoneNumber'] ?? '',
      password: json['password'] ?? '',
    );
  }

}