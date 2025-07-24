import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String name;
  final String email;
  final String profileimage;
  final String expertise;
  final String qualifications;
  final String degreeimage;
  final String adress;
  final String contact;
  final String docid;
  final String createdat;

  UserModel({
    required this.name,
    required this.email,
    required this.profileimage,
    required this.expertise,
    required this.qualifications,
    required this.degreeimage,
    required this.adress,
    required this.contact,
    required this.docid,
    required this.createdat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    profileimage: json["profileimage"],
    expertise: json["expertise"],
    qualifications: json["qualifications"],
    degreeimage: json["degreeimage"],
    adress: json["adress"],
    contact: json["contact"],
    docid: json["docid"],
    createdat: json["createdat"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "profileimage": profileimage,
    "expertise": expertise,
    "qualifications": qualifications,
    "degreeimage": degreeimage,
    "adress": adress,
    "contact": contact,
    "docid": docid,
    "createdat": createdat,
  };
}
