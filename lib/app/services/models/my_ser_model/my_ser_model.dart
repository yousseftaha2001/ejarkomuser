import 'dart:convert';

import 'myserve.dart';

class MySerModel {
  bool? status;
  String? errNum;
  String? msg;
  List<Myserve>? myserves;

  MySerModel({this.status, this.errNum, this.msg, this.myserves});

  factory MySerModel.fromMap(Map<String, dynamic> data) => MySerModel(
        status: data['status'] as bool?,
        errNum: data['errNum'] as String?,
        msg: data['msg'] as String?,
        myserves: (data['myserves'] as List<dynamic>?)
            ?.map((e) => Myserve.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'errNum': errNum,
        'msg': msg,
        'myserves': myserves?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MySerModel].
  factory MySerModel.fromJson(String data) {
    return MySerModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MySerModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
