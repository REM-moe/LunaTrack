import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: MaterialButton(
        height: 10,
        onPressed: () {},
        child: Text("hi"),
        color: Colors.grey,
      ),
    ));
  }
}
