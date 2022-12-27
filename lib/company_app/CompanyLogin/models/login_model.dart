///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType
import 'dart:convert';

import 'package:ejarkom/utils/apis.dart';



LoginModel? loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel? data) => json.encode(data!.toJson());

class LoginModel {
  LoginModel({
    this.user,
    this.status,
    this.token,
  });

  User? user;
  bool? status;
  String? token;

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        user: User.fromJson(json["user"]),
        status: json["status"],
        token: json["token"],
      );

  Map<dynamic, dynamic> toJson() => {
        "user": user!.toJson(),
        "status": status,
        "token": token,
      };
}

class User {
  User({
    this.updatedAt,
    this.phone,
    this.numAds,
    this.name,
    this.fire,
    this.createdAt,
    this.id,
    this.type,
    this.stute,
    this.photo,
    this.email,
  });

  DateTime? updatedAt;
  String? phone;
  String? photo;
  int? numAds;
  String? name;
  String? fire;
  DateTime? createdAt;
  int? id;
  String? type;
  String? stute;
  String? email;

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        updatedAt: DateTime.parse(json["updated_at"]),
        phone: json["phone"],
        photo: '$photoAPI${json["photo"]}',
        numAds: json["num_ads"],
        name: json["name"],
        fire: json["fire"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        type: json["type"],
        stute: json["stute"],
        email: json["email"],
      );

  Map<dynamic, dynamic> toJson() => {
        "updated_at": updatedAt!.toIso8601String(),
        "phone": phone,
        "num_ads": numAds,
        "name": name,
        "fire": fire,
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "type": type,
        "stute": stute,
        "email": email,
      };
}
