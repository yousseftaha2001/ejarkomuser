class MyDataModel {
  MyDataModel({
    this.status,
    this.errNum,
    this.msg,
    this.myData,
  });

  MyDataModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['my_data'] != null) {
      myData = [];
      json['my_data'].forEach((v) {
        myData?.add(MyData.fromJson(v));
      });
    }
  }

  bool? status;
  String? errNum;
  String? msg;
  List<MyData>? myData;

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

class MyData {
  MyData({
    this.id,
    this.userId,
    this.photo1,
    this.photo2,
    this.stute,
    this.dob,
    this.address,
    this.empId,
    this.createdAt,
    this.updatedAt,
  });

  MyData.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    stute = json['stute'];
    dob = json['DOB'];
    address = json['address'];
    empId = json['emp_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  num? userId;
  String? photo1;
  String? photo2;
  String? stute;
  String? dob;
  String? address;
  dynamic empId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['photo1'] = photo1;
    map['photo2'] = photo2;
    map['stute'] = stute;
    map['DOB'] = dob;
    map['address'] = address;
    map['emp_id'] = empId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
