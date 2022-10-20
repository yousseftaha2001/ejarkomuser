import 'dart:convert';

import 'ad.dart';

class AllAdsRequest {
  bool? status;
  String? errNum;
  String? msg;
  List<Ad>? ads;

  AllAdsRequest({this.status, this.errNum, this.msg, this.ads});

  factory AllAdsRequest.fromMap(Map<String, dynamic> data) => AllAdsRequest(
        status: data['status'] as bool?,
        errNum: data['errNum'] as String?,
        msg: data['msg'] as String?,
        ads: (data['ads'] as List<dynamic>?)
            ?.map((e) => Ad.fromMap(e as Map<String, dynamic>))
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
  /// Parses the string and returns the resulting Json object as [AllAdsRequest].
  factory AllAdsRequest.fromJson(String data) {
    return AllAdsRequest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AllAdsRequest] to a JSON string.
  String toJson() => json.encode(toMap());
}
