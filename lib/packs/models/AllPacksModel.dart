class AllPacksModel {
  AllPacksModel({
    this.status,
    this.errNum,
    this.msg,
    this.pandleAds,
  });

  AllPacksModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['pandle_ads'] != null) {
      pandleAds = [];
      json['pandle_ads'].forEach((v) {
        pandleAds?.add(PandleAds.fromJson(v));
      });
    }
  }

  bool? status;
  String? errNum;
  String? msg;
  List<PandleAds>? pandleAds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (pandleAds != null) {
      map['pandle_ads'] = pandleAds?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class PandleAds {
  PandleAds({
    this.id,
    this.nameA,
    this.nameE,
    this.textA,
    this.textE,
    this.numAds,
    this.cost,
    this.stute,
    this.createdAt,
    this.updatedAt,
  });

  PandleAds.fromJson(dynamic json) {
    id = json['id'];
    nameA = json['name_A'];
    nameE = json['name_E'];
    textA = json['text_A'];
    textE = json['text_E'];
    numAds = json['num_ads'];
    cost = json['cost'];
    stute = json['stute'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? nameA;
  String? nameE;
  String? textA;
  String? textE;
  num? numAds;
  num? cost;
  num? stute;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_A'] = nameA;
    map['name_E'] = nameE;
    map['text_A'] = textA;
    map['text_E'] = textE;
    map['num_ads'] = numAds;
    map['cost'] = cost;
    map['stute'] = stute;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
