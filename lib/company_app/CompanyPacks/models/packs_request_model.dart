///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType
import 'dart:convert';

PacksRequestModel? packsRequestModelFromJson(String str) =>
    PacksRequestModel.fromJson(json.decode(str));

String packsRequestModelToJson(PacksRequestModel? data) =>
    json.encode(data!.toJson());

class PacksRequestModel {
  PacksRequestModel({
    this.msg,
    this.errNum,
    this.pandleAds,
    this.status,
  });

  String? msg;
  String? errNum;
  List<PandleAd?>? pandleAds;
  bool? status;

  factory PacksRequestModel.fromJson(Map<dynamic, dynamic> json) =>
      PacksRequestModel(
        msg: json["msg"],
        errNum: json["errNum"],
        pandleAds: List<PandleAd?>.from(
            json["pandle_ads"]!.map((x) => PandleAd.fromJson(x))),
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "errNum": errNum,
        "pandle_ads": List<dynamic>.from(pandleAds!.map((x) => x!.toJson())),
        "status": status,
      };
}

class PandleAd {
  PandleAd({
    this.nameA,
    this.cost,
    this.updatedAt,
    this.textA,
    this.numAds,
    this.createdAt,
    this.textE,
    this.id,
    this.nameE,
    this.stute,
  });

  String? nameA;
  int? cost;
  DateTime? updatedAt;
  String? textA;
  int? numAds;
  DateTime? createdAt;
  String? textE;
  int? id;
  String? nameE;
  int? stute;

  factory PandleAd.fromJson(Map<dynamic, dynamic> json) => PandleAd(
        nameA: json["name_A"],
        cost: json["cost"],
        updatedAt: DateTime.parse(json["updated_at"]),
        textA: json["text_A"],
        numAds: json["num_ads"],
        createdAt: DateTime.parse(json["created_at"]),
        textE: json["text_E"],
        id: json["id"],
        nameE: json["name_E"],
        stute: json["stute"],
      );

  Map<dynamic, dynamic> toJson() => {
        "name_A": nameA,
        "cost": cost,
        "updated_at": updatedAt!.toIso8601String(),
        "text_A": textA,
        "num_ads": numAds,
        "created_at": createdAt!.toIso8601String(),
        "text_E": textE,
        "id": id,
        "name_E": nameE,
        "stute": stute,
      };
}
