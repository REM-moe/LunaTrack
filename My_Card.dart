import 'package:flutter/material.dart';

class MyCArd extends StatelessWidget {
  final Color main_color;
  final Color shadow_color;
  final String message;
  MyCArd({
    super.key,
    required this.main_color,
    required this.shadow_color,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.deepPurple,
          height: 114,
          width: 500,
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            color: main_color,
            elevation: 20,
            shadowColor: shadow_color,
            margin: const EdgeInsets.all(22),
            //
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Text(
                    message,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
