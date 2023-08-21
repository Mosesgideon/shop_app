import 'dart:convert';

LoginPayload loginPayloadFromJson(String str) =>
    LoginPayload.fromJson(json.decode(str));

String loginPayloadToJson(LoginPayload data) => json.encode(data.toJson());

class LoginPayload {
  String email;
  String password;

  LoginPayload({
    required this.email,
    required this.password,
  });

  LoginPayload copyWith({
    String? email,
    String? password,
  }) =>
      LoginPayload(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory LoginPayload.fromJson(Map<String, dynamic> json) => LoginPayload(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
