// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) =>
    SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final String status;
  final int statusCode;
  final String message;
  final UserData? data;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        status: json["status"] == null ? null : json["status"],
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "statusCode": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "data": data == null ? null : data?.toJson(),
      };
}

class UserData {
  UserData({
    required this.userId,
    required this.email,
    required this.username,
    required this.phone,
    required this.images,
    required this.createAt,
    required this.updateAt,
    required this.token,
  });

  final String userId;
  final String email;
  final String username;
  final String phone;
  final String images;
  final DateTime? createAt;
  final DateTime? updateAt;
  final String token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["userId"] == null ? null : json["userId"],
        email: json["email"] == null ? null : json["email"],
        username: json["username"] == null ? null : json["username"],
        phone: json["phone"] == null ? null : json["phone"],
        images: json["images"] == null ? null : json["images"],
        createAt: json["create_at"] == null
            ? null
            : DateTime.parse(json["create_at"]),
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),
        token: json["token"] == null ? null : json["token"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId == null ? null : userId,
        "email": email == null ? null : email,
        "username": username == null ? null : username,
        "phone": phone == null ? null : phone,
        "images": images == null ? null : images,
        "create_at": createAt == null ? null : createAt?.toIso8601String(),
        "update_at": updateAt == null ? null : updateAt?.toIso8601String(),
        "token": token == null ? null : token,
      };
}
