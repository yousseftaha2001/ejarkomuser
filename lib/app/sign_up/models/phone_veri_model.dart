///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType

import 'dart:convert';

PhoneVeriModel? phoneVeriModelFromJson(String str) =>
    PhoneVeriModel.fromJson(json.decode(str));

String phoneVeriModelToJson(PhoneVeriModel? data) =>
    json.encode(data!.toJson());

class PhoneVeriModel {
  PhoneVeriModel({
    this.msg,
    this.tryAgain,
    this.errNum,
    this.num,
    this.status,
  });

  String? msg;
  DateTime? tryAgain;
  String? errNum;
  int? num;
  bool? status;

  factory PhoneVeriModel.fromJson(Map<dynamic, dynamic> json) => PhoneVeriModel(
        msg: json["msg"],
        tryAgain: DateTime.parse(json["try_again"]),
        errNum: json["errNum"],
        num: json["num"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "try_again": tryAgain!.toIso8601String(),
        "errNum": errNum,
        "num": num,
        "status": status,
      };
}
