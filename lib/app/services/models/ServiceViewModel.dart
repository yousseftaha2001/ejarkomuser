import 'dart:convert';

class ServiceViewModel {
  ServiceViewModel({
    this.status,
    this.errNum,
    this.msg,
    this.data,
  });

  ServiceViewModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = json['data'] != null ? ServiceAds.fromJson(json['data']) : null;
  }

  bool? status;
  String? errNum;
  String? msg;
  ServiceAds? data;

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

class ServiceAds {
  ServiceAds({
    this.id,
    this.userId,
    this.nameA,
    this.nameE,
    this.cityId,
    this.zoneId,
    this.textA,
    this.textE,
    this.photos,
    this.whats,
    this.phone,
    this.endDate,
    this.stute,
    this.numView,
    this.empId,
    this.packageId,
    this.typeServes,
    this.createdAt,
    this.updatedAt,
    this.cityA,
    this.cityE,
    this.typeBuildE,
    this.typeBuildA,
    this.zonesE,
    this.zonesA,
  });

  ServiceAds.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    nameA = json['name_A'];
    nameE = json['name_E'];
    cityId = json['city_id'];
    zoneId = json['zone_id'];
    textA = json['text_A'];
    textE = json['text_E'];
    photos = json['photos'];
    whats = json['whats'];
    phone = json['phone'];
    endDate = json['end_date'];
    stute = json['stute'];
    numView = json['num_view'];
    empId = json['emp_id'];
    packageId = json['package_id'];
    typeServes = json['type_serves'];
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
  num? userId;
  String? nameA;
  String? nameE;
  num? cityId;
  num? zoneId;
  String? textA;
  String? textE;
  String? photos;
  String? whats;
  String? phone;
  String? endDate;
  String? stute;
  num? numView;
  dynamic empId;
  num? packageId;
  num? typeServes;
  String? createdAt;
  String? updatedAt;
  String? cityA;
  String? cityE;
  String? typeBuildE;
  String? typeBuildA;
  String? zonesE;
  String? zonesA;

  getPhoto() {
    List<dynamic> myImages = [];
    List<dynamic> images = jsonDecode(photos!);
    myImages = images;
    return myImages;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name_A'] = nameA;
    map['name_E'] = nameE;
    map['city_id'] = cityId;
    map['zone_id'] = zoneId;
    map['text_A'] = textA;
    map['text_E'] = textE;
    map['photos'] = photos;
    map['whats'] = whats;
    map['phone'] = phone;
    map['end_date'] = endDate;
    map['stute'] = stute;
    map['num_view'] = numView;
    map['emp_id'] = empId;
    map['package_id'] = packageId;
    map['type_serves'] = typeServes;
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
}
