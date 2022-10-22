import 'dart:convert';

class Myserve {
  int? id;
  int? userId;
  String? nameA;
  String? nameE;
  int? cityId;
  int? zoneId;
  String? textA;
  String? textE;
  String? photos;
  String? whats;
  String? phone;
  String? endDate;
  String? stute;
  int? numView;
  dynamic empId;
  int? packageId;
  int? typeServes;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? cityA;
  String? cityE;
  String? typeBuildE;
  String? typeBuildA;
  String? zonesE;
  String? zonesA;

  Myserve({
    this.id,
    this.userId,
    this.nameA,
    this.nameE,
    this.cityId,
    this.zoneId,
    this.textA,
    this.textE,
    this.photos,
    this.whats,
    this.phone,
    this.endDate,
    this.stute,
    this.numView,
    this.empId,
    this.packageId,
    this.typeServes,
    this.createdAt,
    this.updatedAt,
    this.cityA,
    this.cityE,
    this.typeBuildE,
    this.typeBuildA,
    this.zonesE,
    this.zonesA,
  });

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

  factory Myserve.fromMap(Map<String, dynamic> data) => Myserve(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        nameA: data['name_A'] as String?,
        nameE: data['name_E'] as String?,
        cityId: data['city_id'] as int?,
        zoneId: data['zone_id'] as int?,
        textA: data['text_A'] as String?,
        textE: data['text_E'] as String?,
        photos: data['photos'] as String?,
        whats: data['whats'] as String?,
        phone: data['phone'] as String?,
        endDate: data['end_date'] as String?,
        stute: data['stute'] as String?,
        numView: data['num_view'] as int?,
        empId: data['emp_id'] as dynamic,
        packageId: data['package_id'] as int?,
        typeServes: data['type_serves'] as int?,
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
        'id': id,
        'user_id': userId,
        'name_A': nameA,
        'name_E': nameE,
        'city_id': cityId,
        'zone_id': zoneId,
        'text_A': textA,
        'text_E': textE,
        'photos': photos,
        'whats': whats,
        'phone': phone,
        'end_date': endDate,
        'stute': stute,
        'num_view': numView,
        'emp_id': empId,
        'package_id': packageId,
        'type_serves': typeServes,
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
  /// Parses the string and returns the resulting Json object as [Myserve].
  factory Myserve.fromJson(String data) {
    return Myserve.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Myserve] to a JSON string.
  String toJson() => json.encode(toMap());
}
