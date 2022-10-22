import 'dart:convert';

import 'ads_serve.dart';

class ServiceSectionModel {
  bool? status;
  String? errNum;
  String? msg;
  List<AdsServe>? adsServes;

  ServiceSectionModel({this.status, this.errNum, this.msg, this.adsServes});

  factory ServiceSectionModel.fromMap(Map<String, dynamic> data) {
    return ServiceSectionModel(
      status: data['status'] as bool?,
      errNum: data['errNum'] as String?,
      msg: data['msg'] as String?,
      adsServes: (data['ads_serves'] as List<dynamic>?)
          ?.map((e) => AdsServe.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'errNum': errNum,
        'msg': msg,
        'ads_serves': adsServes?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceSectionModel].
  factory ServiceSectionModel.fromJson(String data) {
    return ServiceSectionModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceSectionModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
