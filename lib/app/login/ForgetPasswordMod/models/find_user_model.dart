
class FindUserModel {
  bool? status;
  String? email;
  String? phone;

  FindUserModel({this.status, this.email, this.phone});

  FindUserModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["email"] = email;
    _data["phone"] = phone;
    return _data;
  }
}