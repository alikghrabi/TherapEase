import 'dart:convert';

class Therapist {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? verificationCode;
  final String? applicationStatus; // pending or accepted
  final String? cvFilePath; // CV
  final int? experience; // how many years of experience (int)
  final String? descriptionProfile; // description in his Profile
  final String? descriptionRegistration; // then description provided by the admin when registering
  final String? nationalIdPicFrontSide; // Hawiye wejj
  final String? nationalIdPicBackSide; // Hawiye afa

  Therapist({
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
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'verificationCode': verificationCode,
      'applicationStatus': applicationStatus,
      'cvFilePath': cvFilePath,
      'experience': experience, // Ensure experience is correctly typed as int?
      'descriptionProfile': descriptionProfile,
      'descriptionRegistration': descriptionRegistration,
      'nationalIdPicFrontSide': nationalIdPicFrontSide,
      'nationalIdPicBackSide': nationalIdPicBackSide,
    };
  }

  String toJson() => json.encode(toMap());

  // JSON to Model
  factory Therapist.fromJson(Map<String, dynamic> json) {
    return Therapist(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      verificationCode: json['verification_code'] as String?,
      applicationStatus: json['application_status'] as String?,
      cvFilePath: json['cv_file_path'] as String?,
      experience: json['experience'] as int?, // Ensure experience is correctly typed as int?
      descriptionProfile: json['description_profile'] as String?,
      descriptionRegistration: json['description_registration'] as String?,
      nationalIdPicFrontSide: json['nationalIdPicFrontSide'] as String?,
      nationalIdPicBackSide: json['nationalIdPicBackSide'] as String?,
    );
  }
}
