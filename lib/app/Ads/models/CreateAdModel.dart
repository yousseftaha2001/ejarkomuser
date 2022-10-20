class CreateAdModel {
  CreateAdModel({
    required this.nameA,
    required this.nameE,
    required this.video,
    required this.descE,
    required this.descA,
    required this.cost,
    required this.costType,
    required this.addressE,
    required this.addressA,
    required this.zoneId,
    required this.typeBuild,
    required this.numRoom,
    required this.numBathroom,
    required this.photos,
  });

  CreateAdModel.fromJson(dynamic json) {
    nameA = json['name_A'];
    nameE = json['name_E'];
    video = json['video'];
    descE = json['desc_E'];
    descA = json['desc_A'];
    cost = json['cost'];
    costType = json['cost_type'];
    addressE = json['address_E'];
    addressA = json['address_A'];
    zoneId = json['zone_id'];
    typeBuild = json['type_build'];
    numRoom = json['num_room'];
    numBathroom = json['num_bathroom'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
  }

  String? nameA;
  String? nameE;
  String? video;
  String? descE;
  String? descA;
  String? cost;
  String? costType;
  String? addressE;
  String? addressA;
  String? zoneId;
  String? typeBuild;
  String? numRoom;
  String? numBathroom;
  List<String>? photos;

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['name_A'] = nameA!;
    map['name_E'] = nameE!;
    map['video'] = video!;
    map['desc_E'] = descE!;
    map['desc_A'] = descA!;
    map['cost'] = cost!;
    map['cost_type'] = costType!;
    map['address_E'] = addressE!;
    map['address_A'] = addressA!;
    map['zone_id'] = zoneId!;
    map['type_build'] = typeBuild!;
    map['num_room'] = numRoom!;
    map['num_bathroom'] = numBathroom!;

    return map;
  }

  @override
  String toString() {
    return 'CreateAdModel{nameA: $nameA, nameE: $nameE, video: $video, descE: $descE, descA: $descA, cost: $cost, costType: $costType, addressE: $addressE, addressA: $addressA, zoneId: $zoneId, typeBuild: $typeBuild, numRoom: $numRoom, numBathroom: $numBathroom, photos: $photos}';
  }
}
