import 'dart:convert';

class BuildViewModel {
  BuildViewModel({
    this.status,
    this.errNum,
    this.msg,
    this.data,
  });

  BuildViewModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  bool? status;
  String? errNum;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.nameA,
    this.nameE,
    this.video,
    this.photos,
    this.descE,
    this.descA,
    this.cost,
    this.costType,
    this.userId,
    this.addressE,
    this.addressA,
    this.numView,
    this.stute,
    this.empId,
    this.cityId,
    this.zoneId,
    this.typeBuild,
    this.typeAds,
    this.numRoom,
    this.numBathroom,
    this.createdAt,
    this.updatedAt,
    this.cityA,
    this.cityE,
    this.typeBuildE,
    this.typeBuildA,
    this.zonesE,
    this.zonesA,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    nameA = json['name_A'];
    nameE = json['name_E'];
    video = json['video'];
    photos = json['photos'];
    descE = json['desc_E'];
    descA = json['desc_A'];
    cost = json['cost'];
    costType = json['cost_type'];
    userId = json['user_id'];
    addressE = json['address_E'];
    addressA = json['address_A'];
    numView = json['num_view'];
    stute = json['stute'];
    empId = json['emp_id'];
    cityId = json['city_id'];
    zoneId = json['zone_id'];
    typeBuild = json['type_build'];
    typeAds = json['type_ads'];
    numRoom = json['num_room'];
    numBathroom = json['num_bathroom'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityA = json['city_A'];
    cityE = json['city_E'];
    typeBuildE = json['type_build_E'];
    typeBuildA = json['type_build_A'];
    zonesE = json['zones_E'];
    zonesA = json['zones_A'];
  }

  num? id;
  String? nameA;
  String? nameE;
  String? video;
  String? photos;
  String? descE;
  String? descA;
  num? cost;
  String? costType;
  num? userId;
  String? addressE;
  String? addressA;
  num? numView;
  String? stute;
  dynamic empId;
  num? cityId;
  num? zoneId;
  num? typeBuild;
  String? typeAds;
  num? numRoom;
  num? numBathroom;
  String? createdAt;
  String? updatedAt;
  String? cityA;
  String? cityE;
  String? typeBuildE;
  String? typeBuildA;
  String? zonesE;
  String? zonesA;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_A'] = nameA;
    map['name_E'] = nameE;
    map['video'] = video;
    map['photos'] = photos;
    map['desc_E'] = descE;
    map['desc_A'] = descA;
    map['cost'] = cost;
    map['cost_type'] = costType;
    map['user_id'] = userId;
    map['address_E'] = addressE;
    map['address_A'] = addressA;
    map['num_view'] = numView;
    map['stute'] = stute;
    map['emp_id'] = empId;
    map['city_id'] = cityId;
    map['zone_id'] = zoneId;
    map['type_build'] = typeBuild;
    map['type_ads'] = typeAds;
    map['num_room'] = numRoom;
    map['num_bathroom'] = numBathroom;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['city_A'] = cityA;
    map['city_E'] = cityE;
    map['type_build_E'] = typeBuildE;
    map['type_build_A'] = typeBuildA;
    map['zones_E'] = zonesE;
    map['zones_A'] = zonesA;
    return map;
  }

  getPhoto() {
    if (photos != null) {
      List<dynamic> result = jsonDecode(photos!);
      print(result.length);
      return result.first;
    } else {
      return '';
    }
  }

  List getAllPhoto() {
    if (photos != null) {
      List<dynamic> result = jsonDecode(photos!);
      print(result.length);
      return result;
    } else {
      return [];
    }
  }
}
