import 'dart:convert';

import 'data.dart';

class OneServices {
  bool? status;
  String? errNum;
  String? msg;
  OneSerivce? data;

  OneServices({this.status, this.errNum, this.msg, this.data});

  factory OneServices.fromMap(Map<String, dynamic> data) => OneServices(
        status: data['status'] as bool?,
        errNum: data['errNum'] as String?,
        msg: data['msg'] as String?,
        data: data['data'] == null
            ? null
            : OneSerivce.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'errNum': errNum,
        'msg': msg,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OneServices].
  factory OneServices.fromJson(String data) {
    return OneServices.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OneServices] to a JSON string.
  String toJson() => json.encode(toMap());
}
