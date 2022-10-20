import 'dart:convert';

class PandleServe {
  num? id;
  String? nameA;
  String? nameE;
  String? textA;
  String? textE;
  num? cost;
  num? days;
  num? stute;
  DateTime? createdAt;
  DateTime? updatedAt;

  PandleServe({
    this.id,
    this.nameA,
    this.nameE,
    this.textA,
    this.textE,
    this.cost,
    this.days,
    this.stute,
    this.createdAt,
    this.updatedAt,
  });

  factory PandleServe.fromMap(Map<String, dynamic> data) => PandleServe(
        id: data['id'] as num?,
        nameA: data['name_A'] as String?,
        nameE: data['name_E'] as String?,
        textA: data['text_A'] as String?,
        textE: data['text_E'] as String?,
        cost: data['cost'] as num?,
        days: data['days'] as num?,
        stute: data['stute'] as num?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name_A': nameA,
        'name_E': nameE,
        'text_A': textA,
        'text_E': textE,
        'cost': cost,
        'days': days,
        'stute': stute,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PandleServe].
  factory PandleServe.fromJson(String data) {
    return PandleServe.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PandleServe] to a JSON string.
  String toJson() => json.encode(toMap());
}
