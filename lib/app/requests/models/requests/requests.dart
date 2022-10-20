import 'dart:convert';

import 'ad.dart';

class Requests {
  bool? status;
  String? errNum;
  String? msg;
  List<RequestAd>? ads;

  Requests({this.status, this.errNum, this.msg, this.ads});

  factory Requests.fromMap(Map<String, dynamic> data) => Requests(
        status: data['status'] as bool?,
        errNum: data['errNum'] as String?,
        msg: data['msg'] as String?,
        ads: (data['ads'] as List<dynamic>?)
            ?.map((e) => RequestAd.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'errNum': errNum,
        'msg': msg,
        'ads': ads?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Requests].
  factory Requests.fromJson(String data) {
    return Requests.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Requests] to a JSON string.
  String toJson() => json.encode(toMap());
}
