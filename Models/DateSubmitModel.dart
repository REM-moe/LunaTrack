// To parse this JSON data, do
//
//     final postDates = postDatesFromJson(jsonString);

import 'dart:convert';

PostDates postDatesFromJson(String str) => PostDates.fromJson(json.decode(str));

String postDatesToJson(PostDates data) => json.encode(data.toJson());

class PostDates {
  DateTime? fdlp;
  String? acd;

  PostDates({
    this.fdlp,
    this.acd,
  });

  factory PostDates.fromJson(Map<String, dynamic> json) => PostDates(
        fdlp: DateTime.parse(json["fdlp"]),
        acd: json["acd"],
      );

  Map<String, dynamic> toJson() => {
        "fdlp":
            "${fdlp?.year.toString().padLeft(4, '0')}-${fdlp?.month.toString().padLeft(2, '0')}-${fdlp?.day.toString().padLeft(2, '0')}",
        "acd": acd,
      };
}
