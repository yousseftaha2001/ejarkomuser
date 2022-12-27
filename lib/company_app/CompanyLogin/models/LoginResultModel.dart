class LoginResultModel {
  LoginResultModel({
    this.status,
    this.token,
    this.user,
  });

  LoginResultModel.fromJson(dynamic json) {
    status = json['status'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  bool? status;
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
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
    this.updatedAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'].toString();
    name = json['name'].toString();
    phone = json['phone'].toString();
    stute = json['stute'].toString();
    type = json['type'].toString();
    email = json['email'].toString();
    fire = json['fire'].toString();
    numAds = json['num_ads'].toString();
    emailVerifiedAt = json['email_verified_at'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }

  String? id;
  String? name;
  String? phone;
  String? stute;
  String? type;
  String? email;
  String? fire;
  String? numAds;
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
