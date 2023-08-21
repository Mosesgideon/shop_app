
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String accessToken;
  User user;

  LoginResponse({
    required this.accessToken,
    required this.user,
  });

  LoginResponse copyWith({
    String? accessToken,
    User? user,
  }) =>
      LoginResponse(
        accessToken: accessToken ?? this.accessToken,
        user: user ?? this.user,
      );

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    accessToken: json["accessToken"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "user": user.toJson(),
  };
}

class User {
  String id;
  String phone;
  String firstname;
  String lastname;
  String username;

  User({
    required this.id,
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.username,
  });

  User copyWith({
    String? id,
    String? phone,
    String? firstname,
    String? lastname,
    String? username,
  }) =>
      User(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
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
