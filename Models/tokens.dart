// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  String? accessToken;
  String? refreshToken;
  String? username;

  Token({
    this.accessToken,
    this.refreshToken,
    this.username,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access token"] as String,
        refreshToken: json["refresh_token"] as String,
        username: json["username"] as String,
      );

  Map<String, dynamic> toJson() => {
        "access token": accessToken,
        "refresh_token": refreshToken,
        "username": username,
      };
}
