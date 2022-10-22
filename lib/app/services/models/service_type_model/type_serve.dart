import 'dart:convert';

class TypeServe {
  num? id;
  String? nameA;
  String? nameE;
  String? photo;
  num? stute;
  DateTime? createdAt;
  DateTime? updatedAt;

  TypeServe({
    this.id,
    this.nameA,
    this.nameE,
    this.photo,
    this.stute,
    this.createdAt,
    this.updatedAt,
  });

  factory TypeServe.fromMap(Map<String, dynamic> data) => TypeServe(
        id: data['id'] as num?,
        nameA: data['name_A'] as String?,
        nameE: data['name_E'] as String?,
        photo: data['photo'] as String?,
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
        'photo': photo,
        'stute': stute,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TypeServe].
  factory TypeServe.fromJson(String data) {
    return TypeServe.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TypeServe] to a JSON string.
  String toJson() => json.encode(toMap());
}
