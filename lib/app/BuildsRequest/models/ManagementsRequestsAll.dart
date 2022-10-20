class ManagementsRequestsAll {
  ManagementsRequestsAll({
      this.status, 
      this.errNum, 
      this.msg, 
      this.myData,});

  ManagementsRequestsAll.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['my_data'] != null) {
      myData = [];
      json['my_data'].forEach((v) {
        myData?.add(ManagementRequest.fromJson(v));
      });
    }
  }
  bool? status;
  String? errNum;
  String? msg;
  List<ManagementRequest>? myData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (myData != null) {
      map['my_data'] = myData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ManagementRequest {
  ManagementRequest({
      this.id, 
      this.userId, 
      this.name, 
      this.photos, 
      this.vidoe, 
      this.desc, 
      this.cost, 
      this.phone, 
      this.address, 
      this.stute, 
      this.typeBuild, 
      this.cityId, 
      this.zoneId, 
      this.empId, 
      this.mess, 
      this.createdAt, 
      this.updatedAt,});

  ManagementRequest.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    photos = json['photos'];
    vidoe = json['vidoe'];
    desc = json['desc'];
    cost = json['cost'];
    phone = json['phone'];
    address = json['address'];
    stute = json['stute'];
    typeBuild = json['type_build'];
    cityId = json['city_id'];
    zoneId = json['zone_id'];
    empId = json['emp_id'];
    mess = json['mess'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? userId;
  String? name;
  String? photos;
  String? vidoe;
  String? desc;
  num? cost;
  String? phone;
  String? address;
  String? stute;
  num? typeBuild;
  num? cityId;
  num? zoneId;
  dynamic empId;
  dynamic mess;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['photos'] = photos;
    map['vidoe'] = vidoe;
    map['desc'] = desc;
    map['cost'] = cost;
    map['phone'] = phone;
    map['address'] = address;
    map['stute'] = stute;
    map['type_build'] = typeBuild;
    map['city_id'] = cityId;
    map['zone_id'] = zoneId;
    map['emp_id'] = empId;
    map['mess'] = mess;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}