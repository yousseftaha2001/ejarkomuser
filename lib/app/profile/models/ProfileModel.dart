class ProfileModel {
  ProfileModel({
      this.status, 
      this.errNum, 
      this.msg, 
      this.dataUser,});

  ProfileModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    dataUser = json['data_user'] != null ? DataUser.fromJson(json['data_user']) : null;
  }
  bool? status;
  String? errNum;
  String? msg;
  DataUser? dataUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (dataUser != null) {
      map['data_user'] = dataUser?.toJson();
    }
    return map;
  }

}

class DataUser {
  DataUser({
      this.id, 
      this.name, 
      this.phone, 
      this.stute, 
      this.type, 
      this.email, 
      this.fire, 
      this.numAds, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  DataUser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    stute = json['stute'];
    type = json['type'];
    email = json['email'];
    fire = json['fire'];
    numAds = json['num_ads'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? phone;
  String? stute;
  String? type;
  String? email;
  String? fire;
  num? numAds;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['stute'] = stute;
    map['type'] = type;
    map['email'] = email;
    map['fire'] = fire;
    map['num_ads'] = numAds;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}