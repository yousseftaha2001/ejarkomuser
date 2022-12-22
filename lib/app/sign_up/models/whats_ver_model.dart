///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType

import 'dart:convert';

WhatsVerModel? whatsVerModelFromJson(String str) =>
    WhatsVerModel.fromJson(json.decode(str));

String whatsVerModelToJson(WhatsVerModel? data) => json.encode(data!.toJson());

class WhatsVerModel {
  WhatsVerModel({
    this.msg,
    this.errNum,
    this.num,
    this.status,
  });

  String? msg;
  String? errNum;
  int? num;
  bool? status;

  factory WhatsVerModel.fromJson(Map<dynamic, dynamic> json) => WhatsVerModel(
        msg: json["msg"],
        errNum: json["errNum"],
        num: json["num"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "errNum": errNum,
        "num": num,
        "status": status,
      };
}
