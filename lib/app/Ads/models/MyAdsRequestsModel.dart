class MyAdsRequestsModel {
  MyAdsRequestsModel({
    this.status,
    this.errNum,
    this.msg,
    this.reqest,
  });

  MyAdsRequestsModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['reqest'] != null) {
      reqest = [];
      json['reqest'].forEach((v) {
        reqest?.add(Request.fromJson(v));
      });
    }
  }

  bool? status;
  String? errNum;
  String? msg;
  List<Request>? reqest;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (reqest != null) {
      map['reqest'] = reqest?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Request {
  Request({
    this.reqestId,
    this.adsId,
    this.userId,
    this.reqestStatus,
    this.reqestCreatedAt,
    this.name,
    this.phone,
    this.email,
  });

  Request.fromJson(dynamic json) {
    reqestId = json['reqest_id'];
    adsId = json['ads_id'];
    userId = json['user_id'];
    reqestStatus = json['reqest_status'];
    reqestCreatedAt = json['reqest_created_at'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  num? reqestId;
  num? adsId;
  num? userId;
  String? reqestStatus;
  String? reqestCreatedAt;
  String? name;
  String? phone;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reqest_id'] = reqestId;
    map['ads_id'] = adsId;
    map['user_id'] = userId;
    map['reqest_status'] = reqestStatus;
    map['reqest_created_at'] = reqestCreatedAt;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    return map;
  }
}
