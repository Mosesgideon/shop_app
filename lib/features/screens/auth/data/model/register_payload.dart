// To parse this JSON data, do
//
//     final registerPayload = registerPayloadFromJson(jsonString);

import 'dart:convert';

RegisterPayload registerPayloadFromJson(String str) => RegisterPayload.fromJson(json.decode(str));

String registerPayloadToJson(RegisterPayload data) => json.encode(data.toJson());

class RegisterPayload {
  String email;
  String firstname;
  String lastname;
  String password;
  String phone;
  String username;

  RegisterPayload({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.phone,
    required this.username,
  });

  RegisterPayload copyWith({
    String? email,
    String? firstname,
    String? lastname,
    String? password,
    String? phone,
    String? username,
  }) =>
      RegisterPayload(
        email: email ?? this.email,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        username: username ?? this.username,
      );

  factory RegisterPayload.fromJson(Map<String, dynamic> json) => RegisterPayload(
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    password: json["password"],
    phone: json["phone"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "password": password,
    "phone": phone,
    "username": username,
  };
}
