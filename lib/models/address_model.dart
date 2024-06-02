// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  final String mobileNumber;
  final String name;
  final String location;
  final String pincode;

  AddressModel({
    required this.name,
    required this.location,
    required this.mobileNumber,
    required this.pincode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
      'mobileNumber' : mobileNumber,
      'pincode' : pincode,
    };
  }

  factory AddressModel.fromMap(Map<String?, dynamic> map) {
    return AddressModel(
      name: map['name'] as String,
      pincode: map['pincode'] as String,
      location: map['address'] as String,
      mobileNumber: map['mobileNumber'] as String,
    );
  }

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
