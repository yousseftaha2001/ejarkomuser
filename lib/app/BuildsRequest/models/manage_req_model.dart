class ManageRequestModel {
  ManageRequestModel({
    required this.nameA,

    required this.video,
    required this.descE,

    required this.cost,

    required this.addressE,
    required this.phone,

    required this.zoneId,
    required this.typeBuild,

    required this.photos,
  });

  ManageRequestModel.fromJson(dynamic json) {
    nameA = json['name_A'];

    video = json['vidoe'];
    descE = json['desc'];

    cost = json['cost'];
    phone = json['phone'];
    addressE = json['address'];

    zoneId = json['zone_id'];
    typeBuild = json['type_build'];

    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
  }

  String? nameA;

  String? video;
  String? descE;

  String? cost;
  String? phone;
  String? addressE;

  String? zoneId;
  String? typeBuild;

  List<String>? photos;

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['name'] = nameA!;

    map['vidoe'] = video!;
    map['desc'] = descE!;

    map['cost'] = cost!;
    map['phone'] = phone!;
    map['address'] = addressE!;

    map['zone_id'] = zoneId!;
    map['type_build'] = typeBuild!;


    return map;
  }

  @override
  String toString() {
    return 'CreateAdModel{nameA: $nameA, nameE: , video: $video, descE: $descE, descA: , cost: $cost, costType: , addressE: $addressE, addressA: , zoneId: $zoneId, typeBuild: $typeBuild, numRoom: , numBathroom: , photos: $photos}';
  }
}
