///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType
import 'dart:convert';

import 'package:ejarkom/utils/apis.dart';


AdsRequestsModel? adsRequestModelFromJson(String str) =>
    AdsRequestsModel.fromJson(json.decode(str));

String adsRequestModelToJson(AdsRequestsModel? data) =>
    json.encode(data!.toJson());

class AdsRequestsModel {
  AdsRequestsModel({
    this.msg,
    this.reqest,
    this.errNum,
    this.status,
  });

  String? msg;
  List<AdsRequest?>? reqest;
  String? errNum;
  bool? status;

  factory AdsRequestsModel.fromJson(Map<dynamic, dynamic> json) =>
      AdsRequestsModel(
        msg: json["msg"],
        reqest: List<AdsRequest?>.from(
            json["reqest"]!.map((x) => AdsRequest.fromJson(x))),
        errNum: json["errNum"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "reqest": List<dynamic>.from(reqest!.map((x) => x!.toJson())),
        "errNum": errNum,
        "status": status,
      };
}

class AdsRequest {
  AdsRequest({
    this.userId,
    this.phone,
    this.reqestId,
    this.adsId,
    this.reqestStatus,
    this.name,
    this.reqestCreatedAt,
    this.email,
    this.photo,
  });

  int? userId;
  String? phone;
  int? reqestId;
  int? adsId;
  String? reqestStatus;
  String? name;
  DateTime? reqestCreatedAt;
  String? email;
  String? photo;

  factory AdsRequest.fromJson(Map<dynamic, dynamic> json) => AdsRequest(
        userId: json["user_id"],
        phone: json["phone"],
        photo: json["photo"]==null?'https://cdn-icons-png.flaticon.com/512/3135/3135715.png':'$photoAPI${json["photo"]}',
        reqestId: json["reqest_id"],
        adsId: json["ads_id"],
        reqestStatus: json["reqest_status"],
        name: json["name"],
        reqestCreatedAt: DateTime.parse(json["reqest_created_at"]),
        email: json["email"],
      );

  Map<dynamic, dynamic> toJson() => {
        "user_id": userId,
        "phone": phone,
        "reqest_id": reqestId,
        "ads_id": adsId,
        "reqest_status": reqestStatus,
        "name": name,
        "reqest_created_at": reqestCreatedAt!.toIso8601String(),
        "email": email,
      };
}
