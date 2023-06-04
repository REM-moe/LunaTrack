// ignore_for_file: non_constant_identifier_names, unused_import
import 'dart:convert';
import 'package:app/pages/Models/http.dart';
import 'package:app/pages/mainmenu.dart';
import 'package:flutter/material.dart';
import '../components/My_TextField.dart';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'Models/LoginModel.dart';
import 'Models/tokens.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _username_controller;
  late final TextEditingController _password_controller;

  @override
  void initState() {
    _username_controller = TextEditingController();
    _password_controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _password_controller.dispose();
    _username_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "LunaTrack        ",
            style: TextStyle(
              fontSize: 38,
              fontStyle: FontStyle.normal,
              fontFamily: 'Pacific',
              color: Color.fromARGB(255, 255, 191, 0),
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(7.0, 2.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
      // TETXT FIELDS
      body: Column(
        children: [
          //Text Filed
          SizedBox(height: 100, width: MediaQuery.of(context).size.width),
          const Text(
            "Nice Seeing You Again",
            style: TextStyle(
              color: Color.fromARGB(255, 243, 255, 17),
              fontSize: 20,
              shadows: <Shadow>[
                Shadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  offset: Offset(7.0, 2.0),
                )
              ],
              fontFamily: 'Pacific',
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 30, width: MediaQuery.of(context).size.width),
          // TextBoxes
          MYtextBox(
              textmsg: "Username",
              obscureText: false,
              Controller: _username_controller),
          MYtextBox(
              textmsg: "Password",
              obscureText: true,
              Controller: _password_controller),

          // BUTTON
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  //Register method
                },
                child: GestureDetector(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          offset: Offset(7.0, 2.0),
                        )
                      ],
                      fontFamily: 'Pacific',
                      color: Color.fromARGB(255, 243, 106, 255),
                    ),
                  ),
                  // ignore: curly_braces_in_flow_control_structures
                  onTap: () async {
                    // Sign In method
                    var result = await Authenticaton().login(
                        _username_controller.text, _password_controller.text);
                    if (result == 200) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainMenu(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
