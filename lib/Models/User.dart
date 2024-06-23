import 'dart:convert';

class User {
  final int? id; // Change type to int?
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
    this.verificationCode,
  });

  // Model to JSON
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'verificationCode': verificationCode,
    };
  }

  String toJson() => json.encode(toMap());

  // JSON to Model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?, // Parse 'id' as int
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      verificationCode: json['verificationCode'] as String?,
    );
  }
}
