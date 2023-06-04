// To parse this JSON data, do
//
//     final getAllJournals = getAllJournalsFromJson(jsonString);

import 'dart:convert';

List<GetAllJournals> getAllJournalsFromJson(String str) =>
    List<GetAllJournals>.from(
        json.decode(str).map((x) => GetAllJournals.fromJson(x)));

String getAllJournalsToJson(List<GetAllJournals> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllJournals {
  int? journalId;
  DateTime? date;
  String? title;
  String? description;
  String? username;

  GetAllJournals({
    this.journalId,
    this.date,
    this.title,
    this.description,
    this.username,
  });

  factory GetAllJournals.fromJson(Map<String, dynamic> json) => GetAllJournals(
        journalId: json["journal_id"],
        date: DateTime.parse(json["date"]),
        title: json["title"],
        description: json["description"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "journal_id": journalId,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "title": title,
        "description": description,
        "username": username,
      };
}
