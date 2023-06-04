// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, unused_import, unnecessary_import, depend_on_referenced_packages
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyDates extends StatefulWidget {
  const MyDates({super.key});

  @override
  State<MyDates> createState() => _MyDatesState();
}

class _MyDatesState extends State<MyDates> {
  late DateTime fdlp = DateTime.now();
  late int acd = 28;
  @override
  void initState() {
    super.initState();
    fdlp = DateTime.now();
    acd = 28;
  }

  late DateTime selectedDay;
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      Meeting(
        'Today',
        startTime,
        endTime,
        const Color(0xFF0F8644),
        false,
      ),
    );
    meetings.add(
      Meeting(
        "Menstruation Start",
        CalculateDates().menstruation_start(fdlp),
        CalculateDates().menstruation_end(fdlp),
        Colors.redAccent,
        true,
      ),
    );
    meetings.add(
      Meeting(
        "Ovulation",
        CalculateDates().ovulation(fdlp),
        CalculateDates().ovulation(fdlp),
        const Color.fromARGB(255, 17, 0, 255),
        true,
      ),
    );
    meetings.add(
      Meeting(
        "Fertile Window",
        CalculateDates().fertile_win_start_day(fdlp),
        CalculateDates().fertile_win_end_day(fdlp),
        const Color.fromARGB(255, 255, 0, 166),
        true,
      ),
    );
    meetings.add(
      Meeting(
        "Next Period",
        CalculateDates().nextperiod(fdlp, acd),
        CalculateDates().nextperiod(fdlp, acd),
        Colors.purple,
        true,
      ),
    );
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 152, 180, 255),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 450,
                child: SfCalendar(
                  showNavigationArrow: true,
                  initialSelectedDate: DateTime.now(),
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(_getDataSource()),
                  monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                  selectionDecoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 43, 255, 0), width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 127, 76, 255),
                      offset: Offset(5, -10),
                      blurRadius: 20,
                    )
                  ],
                  color: Color.fromARGB(255, 0, 160, 139),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              child: const Text(
                                "Change Date",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 222, 220, 220),
                                    fontFamily: 'Pacific',
                                    fontSize: 20,
                                    shadows: [
                                      Shadow(
                                        color: Color.fromARGB(255, 78, 59, 59),
                                        offset: Offset(1, 1),
                                      )
                                    ]),
                              ),
                              onTap: () async {
                                print("fdlp");
                                DateTime? pickeddate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2023),
                                  lastDate: DateTime(2024),
                                );
                                if (pickeddate != null) {
                                  setState(() {
                                    fdlp = pickeddate;
                                  });
                                } else if (pickeddate == null) {
                                  fdlp = DateTime.now();
                                }
                              },
                            ),
                            GestureDetector(
                              child: const Text(
                                "Change Days",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 222, 220, 220),
                                  fontFamily: 'Pacific',
                                  fontSize: 20,
                                  shadows: [
                                    Shadow(
                                      color: Color.fromARGB(255, 78, 59, 59),
                                      offset: Offset(1, 1),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () {
                                showDialog<int>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title:
                                          const Text("Average Cycle Duration"),
                                      content: StatefulBuilder(
                                        builder: (context, setState) {
                                          return NumberPicker(
                                            selectedTextStyle: const TextStyle(
                                                color: Colors.red),
                                            value: acd,
                                            minValue: 1,
                                            maxValue: 100,
                                            onChanged: (value) =>
                                                setState(() => acd = value),
                                          );
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text("OK",
                                              style: TextStyle(
                                                  fontFamily: "Pacific")),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: Text(
                            "Today:  " +
                                DateFormat("EEEEEEEE, M/d/y")
                                    .format(DateTime.now()),
                            style: const TextStyle(
                                color: Colors.amberAccent,
                                fontFamily: 'Pacific',
                                fontSize: 27),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const Column(
                                children: [
                                  Icon(
                                    Icons.timelapse,
                                    color: Color.fromARGB(255, 255, 111, 0),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.timelapse,
                                    color: Color.fromARGB(255, 255, 102, 0),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.timelapse,
                                    color: Color.fromARGB(255, 0, 64, 255),
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.pink,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.timelapse,
                                    color: Colors.purple,
                                    size: 20,
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Column(
                                  children: [
                                    Text(
                                      "Menstruation Start: " +
                                          CalculateDates().convert(
                                              CalculateDates()
                                                  .menstruation_start(fdlp)),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'SF-Pro-Text-Bold',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Menstruation End: " +
                                          CalculateDates().convert(
                                              CalculateDates()
                                                  .menstruation_end(fdlp)),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'SF-Pro-Text-Bold',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Ovulation: " +
                                          CalculateDates().convert(
                                              CalculateDates().ovulation(fdlp)),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'SF-Pro-Text-Bold',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Fertile Window Start: " +
                                          CalculateDates().convert(
                                              CalculateDates()
                                                  .fertile_win_start_day(fdlp)),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'SF-Pro-Text-Bold',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Fertile Window End: " +
                                          CalculateDates().convert(
                                              CalculateDates()
                                                  .fertile_win_end_day(fdlp)),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'SF-Pro-Text-Bold',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "Next Period: " +
                                          CalculateDates().convert(
                                              CalculateDates()
                                                  .nextperiod(fdlp, acd)),
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'SF-Pro-Text-Bold',
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculateDates {
  fertile_win_start_day(DateTime fdlp) => fdlp.add(const Duration(days: 10));
  fertile_win_end_day(DateTime fdlp) => fdlp.add(const Duration(days: 13));
  nextperiod(DateTime fdlp, int acd) => fdlp.add(Duration(days: acd));
  ovulation(DateTime fdlp) => fdlp.add(const Duration(days: 14));
  menstruation_end(DateTime fdlp) => fdlp.add(const Duration(days: 5));
  menstruation_start(DateTime fdlp) => fdlp;
  DateFormat date = DateFormat('d/M/y');
  convert(DateTime dates) => date.format(dates);
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
