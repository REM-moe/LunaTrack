import 'dart:convert';

GetUserDate getUserDateFromJson(String str) =>
    GetUserDate.fromJson(json.decode(str));

String getUserDateToJson(GetUserDate data) => json.encode(data.toJson());

class GetUserDate {
  DateTime? fdlp;
  int? acd;
  DateTime? nextPeriodDate;
  DateTime? fertileWindowStart;
  DateTime? fertileWindowEnd;
  DateTime? ovulationDate;
  DateTime? pregTestDate;
  DateTime? menDateStart;
  DateTime? menDateEnd;
  String? username;
  int? usrId;

  GetUserDate({
    this.fdlp,
    this.acd,
    this.nextPeriodDate,
    this.fertileWindowStart,
    this.fertileWindowEnd,
    this.ovulationDate,
    this.pregTestDate,
    this.menDateStart,
    this.menDateEnd,
    this.username,
    this.usrId,
  });

  factory GetUserDate.fromJson(Map<String, dynamic> json) => GetUserDate(
        fdlp: DateTime.parse(json["fdlp"]),
        acd: json["acd"],
        nextPeriodDate: DateTime.parse(json["next_period_date"]),
        fertileWindowStart: DateTime.parse(json["fertile_window_start"]),
        fertileWindowEnd: DateTime.parse(json["fertile_window_end"]),
        ovulationDate: DateTime.parse(json["ovulation_date"]),
        pregTestDate: DateTime.parse(json["preg_test_date"]),
        menDateStart: DateTime.parse(json["men_date_start"]),
        menDateEnd: DateTime.parse(json["men_date_end"]),
        username: json["username"],
        usrId: json["usr_id"],
      );

  Map<String, dynamic> toJson() => {
        "fdlp":
            "${fdlp?.year.toString().padLeft(4, '0')}-${fdlp?.month.toString().padLeft(2, '0')}-${fdlp?.day.toString().padLeft(2, '0')}",
        "acd": acd,
        "next_period_date":
            "${nextPeriodDate?.year.toString().padLeft(4, '0')}-${nextPeriodDate?.month.toString().padLeft(2, '0')}-${nextPeriodDate?.day.toString().padLeft(2, '0')}",
        "fertile_window_start":
            "${fertileWindowStart?.year.toString().padLeft(4, '0')}-${fertileWindowStart?.month.toString().padLeft(2, '0')}-${fertileWindowStart?.day.toString().padLeft(2, '0')}",
        "fertile_window_end":
            "${fertileWindowEnd?.year.toString().padLeft(4, '0')}-${fertileWindowEnd?.month.toString().padLeft(2, '0')}-${fertileWindowEnd?.day.toString().padLeft(2, '0')}",
        "ovulation_date":
            "${ovulationDate?.year.toString().padLeft(4, '0')}-${ovulationDate?.month.toString().padLeft(2, '0')}-${ovulationDate?.day.toString().padLeft(2, '0')}",
        "preg_test_date":
            "${pregTestDate?.year.toString().padLeft(4, '0')}-${pregTestDate?.month.toString().padLeft(2, '0')}-${pregTestDate?.day.toString().padLeft(2, '0')}",
        "men_date_start":
            "${menDateStart?.year.toString().padLeft(4, '0')}-${menDateStart?.month.toString().padLeft(2, '0')}-${menDateStart?.day.toString().padLeft(2, '0')}",
        "men_date_end":
            "${menDateEnd?.year.toString().padLeft(4, '0')}-${menDateEnd?.month.toString().padLeft(2, '0')}-${menDateEnd?.day.toString().padLeft(2, '0')}",
        "username": username,
        "usr_id": usrId,
      };
}
