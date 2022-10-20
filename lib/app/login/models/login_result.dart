import 'dart:convert';

import 'package:ejarkom/app/login/models/user_model.dart';

class LoginResult {
  bool? status;
  String? token;
  User? user;

  LoginResult({this.status, this.token, this.user});

  factory LoginResult.fromMap(Map<String, dynamic> data) => LoginResult(
        status: data['status'] as bool?,
        token: data['token'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'token': token,
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoginResult].
  factory LoginResult.fromJson(String data) {
    return LoginResult.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoginResult] to a JSON string.
  String toJson() => json.encode(toMap());
}
