// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Message MessageFromJson(String str) => Message.fromJson(json.decode(str));

String MessageToJson(Message data) => json.encode(data.toJson());

class Message {
  String? message;

  Message({
    this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
