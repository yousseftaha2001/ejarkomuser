import 'dart:convert';

class SignUpRequestModel {
  String? email;
  String? name;
  String? phone;
  String? password;

  String? tokenMassage;
  SignUpRequestModel({
    this.email,
    this.name,
    this.phone,
    this.password,
    this.tokenMassage,
  });

  Map<String, String> toMap() {
    final result = <String, String>{};

    if (email != null) {
      result.addAll({'email': email!});
    }
    if (name != null) {
      result.addAll({'name': name!});
    }
    if (phone != null) {
      result.addAll({'phone': phone!});
    }
    if (password != null) {
      result.addAll({'password': password!});
    }

    if (tokenMassage != null) {
      result.addAll({'fire': tokenMassage!});
    }

    return result;
  }

  factory SignUpRequestModel.fromMap(Map<String, dynamic> map) {
    return SignUpRequestModel(
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      password: map['password'],
      tokenMassage: map['token_massage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequestModel.fromJson(String source) =>
      SignUpRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpRequestModel(email: $email, name: $name, phone: $phone, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpRequestModel &&
        other.email == email &&
        other.name == name &&
        other.phone == phone &&
        other.password == password;
  }

  @override
  int get hashCode {
    return email.hashCode ^ name.hashCode ^ phone.hashCode ^ password.hashCode;
  }
}
