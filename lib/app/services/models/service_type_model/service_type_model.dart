import 'dart:convert';

import 'type_serve.dart';

class ServiceTypeModel {
  bool? status;
  String? errNum;
  String? msg;
  List<TypeServe>? typeServes;

  ServiceTypeModel({this.status, this.errNum, this.msg, this.typeServes});

  factory ServiceTypeModel.fromMap(Map<String, dynamic> data) {
    return ServiceTypeModel(
      status: data['status'] as bool?,
      errNum: data['errNum'] as String?,
      msg: data['msg'] as String?,
      typeServes: (data['type_serves'] as List<dynamic>?)
          ?.map((e) => TypeServe.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'errNum': errNum,
        'msg': msg,
        'type_serves': typeServes?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ServiceTypeModel].
  factory ServiceTypeModel.fromJson(String data) {
    return ServiceTypeModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ServiceTypeModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
