import 'Zone.dart';

class GetZoneModel {
  GetZoneModel({
    this.status,
    this.errNum,
    this.msg,
    this.zones,
  });

  GetZoneModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['zone'] != null) {
      zones = [];
      json['zone'].forEach((v) {
        zones?.add(Zone.fromJson(v));
      });
    }
  }
  bool? status;
  String? errNum;
  String? msg;
  List<Zone>? zones;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (zones != null) {
      map['zone'] = zones?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
