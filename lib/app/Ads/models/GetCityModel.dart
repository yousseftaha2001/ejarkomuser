class GetCityModel {
  GetCityModel({
    this.status,
    this.errNum,
    this.msg,
    this.cities,
  });

  GetCityModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['city'] != null) {
      cities = [];
      json['city'].forEach((v) {
        cities?.add(City.fromJson(v));
      });
    }
  }
  bool? status;
  String? errNum;
  String? msg;
  List<City>? cities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (cities != null) {
      map['city'] = cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class City {
  City({
    this.id,
    this.nameA,
    this.nameE,
    this.stute,
    this.createdAt,
    this.updatedAt,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    nameA = json['name_A'];
    nameE = json['name_E'];
    stute = json['stute'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? nameA;
  String? nameE;
  num? stute;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_A'] = nameA;
    map['name_E'] = nameE;
    map['stute'] = stute;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
