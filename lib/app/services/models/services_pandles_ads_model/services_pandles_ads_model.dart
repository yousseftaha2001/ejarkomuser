import 'dart:convert';

import 'pandle_serve.dart';

class ServicesPandlesAdsModel {
  bool? status;
  String? errNum;
  String? msg;
  List<PandleServe>? pandleServe;

  ServicesPandlesAdsModel({
    this.status,
    this.errNum,
    this.msg,
    this.pandleServe,
  });

  factory ServicesPandlesAdsModel.fromMap(Map<String, dynamic> data) {
    return ServicesPandlesAdsModel(
      status: data['status'] as bool?,
      errNum: data['errNum'] as String?,
      msg: data['msg'] as String?,
      pandleServe: (data['pandle_serve'] as List<dynamic>?)
          ?.map((e) => PandleServe.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'errNum': errNum,
        'msg': msg,
        'pandle_serve': pandleServe?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServicesPandlesAdsModel].
  factory ServicesPandlesAdsModel.fromJson(String data) {
    return ServicesPandlesAdsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServicesPandlesAdsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
