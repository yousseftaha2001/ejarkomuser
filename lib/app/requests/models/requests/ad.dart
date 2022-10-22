import 'dart:convert';

class RequestAd {
  num? reqestId;
  String? reqestStatus;
  String? reqestCreatedAt;
  String? reqestUpdatedAt;
  // String? reqestUpdatedAt;
  num? id;
  String? nameA;
  String? nameE;
  String? video;
  String? photos;
  String? descE;
  String? descA;
  num? cost;
  String? costType;
  num? userId;
  String? addressE;
  String? addressA;
  num? numView;
  String? stute;
  dynamic empId;
  num? cityId;
  num? zoneId;
  num? typeBuild;
  String? typeAds;
  num? numRoom;
  num? numBathroom;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? cityA;
  String? cityE;
  String? typeBuildE;
  String? typeBuildA;
  String? zonesE;
  String? zonesA;

  getPhoto() {
    if (photos != null) {
      List<dynamic> result = jsonDecode(photos!);
      print(result.length);
      return result.first;
    } else {
      return '';
    }
  }

  getAllPhoto() {
    if (photos != null) {
      List<dynamic> result = jsonDecode(photos!);
      print(result.length);
      return result;
    } else {
      return '';
    }
  }

  RequestAd({
    this.reqestId,
    this.reqestStatus,
    this.reqestCreatedAt,
    this.reqestUpdatedAt,
    this.id,
    this.nameA,
    this.nameE,
    this.video,
    this.photos,
    this.descE,
    this.descA,
    this.cost,
    this.costType,
    this.userId,
    this.addressE,
    this.addressA,
    this.numView,
    this.stute,
    this.empId,
    this.cityId,
    this.zoneId,
    this.typeBuild,
    this.typeAds,
    this.numRoom,
    this.numBathroom,
    this.createdAt,
    this.updatedAt,
    this.cityA,
    this.cityE,
    this.typeBuildE,
    this.typeBuildA,
    this.zonesE,
    this.zonesA,
  });

  factory RequestAd.fromMap(Map<String, dynamic> data) => RequestAd(
        reqestId: data['reqest_id'] as num?,
        reqestStatus: data['reqest_status'] as String?,
        reqestCreatedAt: data['reqest_created_at'] as String?,
        reqestUpdatedAt: data['reqest_updated_at'] as String?,
        id: data['id'] as num?,
        nameA: data['name_A'] as String?,
        nameE: data['name_E'] as String?,
        video: data['video'] as String?,
        photos: data['photos'] as String?,
        descE: data['desc_E'] as String?,
        descA: data['desc_A'] as String?,
        cost: data['cost'] as num?,
        costType: data['cost_type'] as String?,
        userId: data['user_id'] as num?,
        addressE: data['address_E'] as String?,
        addressA: data['address_A'] as String?,
        numView: data['num_view'] as num?,
        stute: data['stute'] as String?,
        empId: data['emp_id'] as dynamic,
        cityId: data['city_id'] as num?,
        zoneId: data['zone_id'] as num?,
        typeBuild: data['type_build'] as num?,
        typeAds: data['type_ads'] as String?,
        numRoom: data['num_room'] as num?,
        numBathroom: data['num_bathroom'] as num?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        cityA: data['city_A'] as String?,
        cityE: data['city_E'] as String?,
        typeBuildE: data['type_build_E'] as String?,
        typeBuildA: data['type_build_A'] as String?,
        zonesE: data['zones_E'] as String?,
        zonesA: data['zones_A'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'reqest_id': reqestId,
        'reqest_status': reqestStatus,
        'reqest_created_at': reqestCreatedAt,
        'reqest_updated_at': reqestUpdatedAt,
        'id': id,
        'name_A': nameA,
        'name_E': nameE,
        'video': video,
        'photos': photos,
        'desc_E': descE,
        'desc_A': descA,
        'cost': cost,
        'cost_type': costType,
        'user_id': userId,
        'address_E': addressE,
        'address_A': addressA,
        'num_view': numView,
        'stute': stute,
        'emp_id': empId,
        'city_id': cityId,
        'zone_id': zoneId,
        'type_build': typeBuild,
        'type_ads': typeAds,
        'num_room': numRoom,
        'num_bathroom': numBathroom,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'city_A': cityA,
        'city_E': cityE,
        'type_build_E': typeBuildE,
        'type_build_A': typeBuildA,
        'zones_E': zonesE,
        'zones_A': zonesA,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Ad].
  factory RequestAd.fromJson(String data) {
    return RequestAd.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Ad] to a JSON string.
  String toJson() => json.encode(toMap());
}
