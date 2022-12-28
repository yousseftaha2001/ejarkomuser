///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType
import 'dart:convert';

ProfileRequestModel? profileRequestModelFromJson(String str) =>
    ProfileRequestModel.fromJson(json.decode(str));

String profileRequestModelToJson(ProfileRequestModel? data) =>
    json.encode(data!.toJson());

class ProfileRequestModel {
  ProfileRequestModel({
    this.msg,
    this.errNum,
    this.dataUser,
    this.status,
  });

  String? msg;
  String? errNum;
  DataUser? dataUser;
  bool? status;

  factory ProfileRequestModel.fromJson(Map<dynamic, dynamic> json) =>
      ProfileRequestModel(
        msg: json["msg"],
        errNum: json["errNum"],
        dataUser: DataUser.fromJson(json["data_user"]),
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "errNum": errNum,
        "data_user": dataUser!.toJson(),
        "status": status,
      };
}

class DataUser {
  DataUser({
    this.updatedAt,
    this.phone,
    this.numAds,
    this.name,
    this.createdAt,
    this.id,
    this.type,
    this.stute,
    this.email,
  });

  DateTime? updatedAt;
  String? phone;
  int? numAds;
  String? name;
  DateTime? createdAt;
  int? id;
  String? type;
  String? stute;
  String? email;

  factory DataUser.fromJson(Map<dynamic, dynamic> json) => DataUser(
        updatedAt: DateTime.parse(json["updated_at"]),
        phone: json["phone"],
        numAds: json["num_ads"],
        name: json["name"],
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
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "type": type,
        "stute": stute,
        "email": email,
      };
}
