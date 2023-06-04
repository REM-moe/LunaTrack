import 'package:flutter/material.dart';

class MYtextBox extends StatelessWidget {
  final String textmsg;
  final bool obscureText;
  // ignore: non_constant_identifier_names
  final TextEditingController Controller;

  const MYtextBox({
    super.key,
    required this.textmsg,
    required this.obscureText,
    required this.Controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: Controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: textmsg,
          fillColor: const Color.fromARGB(255, 173, 210, 255),
          filled: true,
        ),
      ),
    );
  }
}
