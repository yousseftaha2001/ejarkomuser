import 'dart:convert';

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? type;
  String? fire;
  String? stute;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.fire,
    this.stute,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.photo,
  });

  factory User.fromMap(Map<String, dynamic> data) => User(
        id: data['id'] as int?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        type: data['type'] as String?,
        fire: data['fire'] as String?,
        stute: data['stute'] as String?,
        photo: data['photo']??'',
        emailVerifiedAt: data['email_verified_at'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'type': type,
        'fire': fire,
        'stute': stute,
        'email_verified_at': emailVerifiedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
