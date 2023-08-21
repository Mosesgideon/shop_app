

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  String id;
  String phone;
  String firstname;
  String lastname;
  String username;

  RegisterResponse({
    required this.id,
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.username,
  });

  RegisterResponse copyWith({
    String? id,
    String? phone,
    String? firstname,
    String? lastname,
    String? username,
  }) =>
      RegisterResponse(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
      );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    id: json["_id"],
    phone: json["phone"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "phone": phone,
    "firstname": firstname,
    "lastname": lastname,
    "username": username,
  };
}
