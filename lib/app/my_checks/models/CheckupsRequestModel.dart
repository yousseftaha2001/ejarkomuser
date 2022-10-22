class CheckupsRequestModel {
  CheckupsRequestModel({
    this.status,
    this.errNum,
    this.msg,
    this.myData,
  });

  CheckupsRequestModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['my_data'] != null) {
      myData = [];
      json['my_data'].forEach((v) {
        myData?.add(Check.fromJson(v));
      });
    }
  }
  bool? status;
  String? errNum;
  String? msg;
  List<Check>? myData;

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

class Check {
  Check({
    this.id,
    this.userId,
    this.custmerId,
    this.mess,
    this.empId,
    this.stute,
    this.createdAt,
    this.updatedAt,
  });

  Check.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    custmerId = json['custmer_id'];
    mess = json['mess'];
    empId = json['emp_id'];
    stute = json['stute'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  num? userId;
  num? custmerId;
  dynamic mess;
  dynamic empId;
  String? stute;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['custmer_id'] = custmerId;
    map['mess'] = mess;
    map['emp_id'] = empId;
    map['stute'] = stute;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
