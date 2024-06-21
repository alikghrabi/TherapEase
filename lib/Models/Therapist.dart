import 'dart:convert';

class Therapist {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? verificationCode;
  final String? applicationStatus; // pending or accepted
  final String? cvFilePath; // CV
  final String? experience; // how many years of experience
  final String? descriptionProfile; // description in his Profile
  final String? descriptionRegistration; // then description provided by the admin when registering
  final String? nationalIdPicFrontSide; // Hawiye wejj
  final String? nationalIdPicBackSide; // Hawiye afa




  Therapist({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.verificationCode,
    this.applicationStatus,
    this.cvFilePath,
    this.experience,
    this.descriptionProfile,
    this.descriptionRegistration,
    this.nationalIdPicFrontSide,
    this.nationalIdPicBackSide,

  });

  // Model to JSON
  Map<String,dynamic> ToMap(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'phone':phone,
      'password':password,
      'verificationCode':verificationCode,
      'applicationStatus':applicationStatus,
      'cvFilePath':cvFilePath,
      'nationalIdPicFrontSide': nationalIdPicFrontSide,
      'nationalIdPicBackSide': nationalIdPicBackSide,
      'experience':experience,
      'descriptionProfile':descriptionProfile,
      'descriptionRegistration':descriptionRegistration,
    };
  }
  String toJson()=> json.encode(ToMap());

  // JSON to Model
  factory Therapist.fromJson(Map<String, dynamic> json) {
    return Therapist(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phoneNumber'] ?? '',
      password: json['password'] ?? '',
      verificationCode: json['verificationCode'] ?? '',
      applicationStatus: json['applicationStatus'] ?? '',
      cvFilePath: json['cvFilePath'] ?? '',
      experience: json['experience'] ?? '',
      descriptionProfile: json['descriptionProfile'] ?? '',
      descriptionRegistration: json['descriptionRegistration'] ?? '',
        nationalIdPicFrontSide: json['nationalIdPicFrontSide'] ?? '',
        nationalIdPicBackSide: json['nationalIdPicBackSide'] ?? ''

    );
  }

}