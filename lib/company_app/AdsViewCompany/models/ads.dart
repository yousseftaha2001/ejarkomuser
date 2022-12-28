///YApi QuickType插件生成，具体参考文档:https://github.com/RmondJone/YapiQuickType
import 'dart:convert';

AdsRequestModel? adsRequestModelFromJson(String str) =>
    AdsRequestModel.fromJson(json.decode(str));

String adsRequestModelToJson(AdsRequestModel? data) =>
    json.encode(data!.toJson());

class AdsRequestModel {
  AdsRequestModel({
    this.msg,
    this.ads,
    this.errNum,
    this.status,
  });

  String? msg;
  List<AdCompany?>? ads;
  String? errNum;
  bool? status;

  factory AdsRequestModel.fromJson(Map<dynamic, dynamic> json) =>
      AdsRequestModel(
        msg: json["msg"],
        ads: List<AdCompany?>.from(json["ads"]!.map((x) => AdCompany.fromJson(x))),
        errNum: json["errNum"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => {
        "msg": msg,
        "ads": List<dynamic>.from(ads!.map((x) => x!.toJson())),
        "errNum": errNum,
        "status": status,
      };
}

class AdCompany {
  AdCompany({
    this.cityA,
    this.costType,
    this.createdAt,
    this.video,
    this.photos,
    this.zoneId,
    this.numView,
    this.zonesE,
    this.updatedAt,
    this.addressA,
    this.zonesA,
    this.typeBuild,
    this.addressE,
    this.id,
    this.cityE,
    this.typeAds,
    this.numRoom,
    this.cost,
    this.typeBuildE,
    this.typeBuildA,
    this.nameE,
    this.stute,
    this.nameA,
    this.numBathroom,
    this.userId,
    this.descA,
    this.descE,
    this.empId,
    this.cityId,
  });

  String? cityA;
  String? costType;
  DateTime? createdAt;
  String? video;
  String? photos;
  num? zoneId;
  num? numView;
  String? zonesE;
  DateTime? updatedAt;
  String? addressA;
  String? zonesA;
  num? typeBuild;
  String? addressE;
  num? id;
  String? cityE;
  String? typeAds;
  num? numRoom;
  num? cost;
  String? typeBuildE;
  String? typeBuildA;
  String? nameE;
  String? stute;
  String? nameA;
  num? numBathroom;
  num? userId;
  String? descA;
  String? descE;
  num? empId;
  num? cityId;

  getPhoto() {
    if (photos != null) {
      List<dynamic> result = jsonDecode(photos!);
      print(result.length);
      return result.first;
    } else {
      return '';
    }
  }

  getAllPhoto() {
    if (photos != null) {
      List<dynamic> result = jsonDecode(photos!);
      print(result.length);
      return result;
    } else {
      return '';
    }
  }

  factory AdCompany.fromJson(Map<dynamic, dynamic> json) => AdCompany(
        cityA: json["city_A"],
        costType: json["cost_type"],
        createdAt: DateTime.parse(json["created_at"]),
        video: json["video"],
        photos: json["photos"],
        zoneId: json["zone_id"],
        numView: json["num_view"],
        zonesE: json["zones_E"],
        updatedAt: DateTime.parse(json["updated_at"]),
        addressA: json["address_A"],
        zonesA: json["zones_A"],
        typeBuild: json["type_build"],
        addressE: json["address_E"],
        id: json["id"],
        cityE: json["city_E"],
        typeAds: json["type_ads"],
        numRoom: json["num_room"],
        cost: json["cost"],
        typeBuildE: json["type_build_E"],
        typeBuildA: json["type_build_A"],
        nameE: json["name_E"],
        stute: json["stute"],
        nameA: json["name_A"],
        numBathroom: json["num_bathroom"],
        userId: json["user_id"],
        descA: json["desc_A"],
        descE: json["desc_E"],
        empId: json["emp_id"],
        cityId: json["city_id"],
      );

  Map<dynamic, dynamic> toJson() => {
        "city_A": cityA,
        "cost_type": costType,
        "created_at": createdAt!.toIso8601String(),
        "video": video,
        "photos": photos,
        "zone_id": zoneId,
        "num_view": numView,
        "zones_E": zonesE,
        "updated_at": updatedAt!.toIso8601String(),
        "address_A": addressA,
        "zones_A": zonesA,
        "type_build": typeBuild,
        "address_E": addressE,
        "id": id,
        "city_E": cityE,
        "type_ads": typeAds,
        "num_room": numRoom,
        "cost": cost,
        "type_build_E": typeBuildE,
        "type_build_A": typeBuildA,
        "name_E": nameE,
        "stute": stute,
        "name_A": nameA,
        "num_bathroom": numBathroom,
        "user_id": userId,
        "desc_A": descA,
        "desc_E": descE,
        "emp_id": empId,
        "city_id": cityId,
      };
}
