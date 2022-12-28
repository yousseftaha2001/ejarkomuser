///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType
import 'dart:convert';

MyDataRequest? myDataRequestFromJson(String str) =>
    MyDataRequest.fromJson(json.decode(str));

String myDataRequestToJson(MyDataRequest? data) => json.encode(data!.toJson());

class MyDataRequest {
  MyDataRequest({
    this.msg,
    this.errNum,
    this.myData,
    this.status,
  });

  String? msg;
  String? errNum;
  List<MyDatum?>? myData;
  bool? status;

  factory MyDataRequest.fromJson(Map<dynamic, dynamic> json) => MyDataRequest(
        msg: json["msg"],
        errNum: json["errNum"],
        myData: List<MyDatum?>.from(
            json["my_data"]!.map((x) => MyDatum.fromJson(x))),
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "errNum": errNum,
        "my_data": List<dynamic>.from(myData!.map((x) => x!.toJson())),
        "status": status,
      };
}

class MyDatum {
  MyDatum({
    this.photo1,
    this.address,
    this.updatedAt,
    this.userId,
    this.createdAt,
    this.id,
    this.photo2,
    this.stute,
  });

  String? photo1;
  String? address;
  DateTime? updatedAt;
  int? userId;
  DateTime? createdAt;
  int? id;
  String? photo2;
  String? stute;

  factory MyDatum.fromJson(Map<dynamic, dynamic> json) => MyDatum(
        photo1: json["photo1"],
        address: json["address"],
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        photo2: json["photo2"],
        stute: json["stute"],
      );

  Map<dynamic, dynamic> toJson() => {
        "photo1": photo1,
        "address": address,
        "updated_at": updatedAt!.toIso8601String(),
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "photo2": photo2,
        "stute": stute,
      };
}
