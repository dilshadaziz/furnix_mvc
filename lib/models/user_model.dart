// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String uid;
  final String fullName;
  final String email;
  final String location;
  final String? profileUrl;
  final String password;
  final List<dynamic> addresses;
  // final String? mobileNumber;

  UserModel({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.location,
    required this.password,
    required this.addresses,
    this.profileUrl,
    // this.mobileNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fullName': fullName,
      'email': email,
      'location': location,
      'profileUrl': profileUrl,
      'password': password,
      'addresses' : addresses,
      // 'mobileNumber' : mobileNumber,
    };
  }

  factory UserModel.fromMap(Map<String?, dynamic> map) {
    print(map["addresses"]);
    return UserModel(
      uid: map['uid'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      location: map['location'] as String,
      profileUrl: map['profileUrl'] != null ? map['profileUrl'] as String : null,
      password: map['password'] as String,
      addresses: map['addresses'] as List<dynamic>,
      // mobileNumber: map['mobileNumber'] as String,
    );
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
