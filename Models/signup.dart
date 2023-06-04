import 'dart:convert';

Signin SigninFromJson(String str) => Signin.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String SignininToJson(Signin data) => json.encode(data.toJson());

class Signin {
  String? username;
  String? password;
  String? email;

  Signin({
    this.username,
    this.password,
    this.email,
  });

  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
        username: json["username"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
      };
}
