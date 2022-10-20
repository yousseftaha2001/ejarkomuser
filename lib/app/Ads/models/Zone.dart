class Zone {
  Zone({
    this.id,
    this.nameA,
    this.nameE,
    this.cityId,
    this.stute,
    this.createdAt,
    this.updatedAt,
  });

  Zone.fromJson(dynamic json) {
    id = json['id'];
    nameA = json['name_A'];
    nameE = json['name_E'];
    cityId = json['city_id'];
    stute = json['stute'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? nameA;
  String? nameE;
  num? cityId;
  num? stute;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_A'] = nameA;
    map['name_E'] = nameE;
    map['city_id'] = cityId;
    map['stute'] = stute;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
