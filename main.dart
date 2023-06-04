// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously, unused_import, non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:app/components/My_TextField.dart';
import 'package:app/pages/Models/LoginModel.dart';
import 'package:app/pages/Models/http.dart';
import 'package:app/pages/Models/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/mainmenu.dart';
import 'pages/Login.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'pages/Models/tokens.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LunaTrack",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String BaseUri = "http://127.0.0.1:5000/auth";

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController _email;
  late final TextEditingController _username;
  late final TextEditingController _password;
  late var Current_User;
  late var Access_token;
  late var Refresh_token;

  @override
  void initState() {
    _email = TextEditingController();
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _username.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "LunaTrack ",
            style: TextStyle(
              letterSpacing: 4.0,
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
//BODY,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Text Filed
          SizedBox(height: 68, width: MediaQuery.of(context).size.width),
          MYtextBox(
            textmsg: "Email",
            obscureText: false,
            Controller: _email,
          ),
          MYtextBox(
            textmsg: "Username",
            obscureText: false,
            Controller: _username,
          ),
          MYtextBox(
            textmsg: "password",
            obscureText: true,
            Controller: _password,
          ),
          // Button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () async {
                  //Register
                },
                child: Flexible(
                  child: GestureDetector(
                    onTap: () async {
                      // Create New User
                      var result = await Authenticaton()
                          .SignUp(_username.text, _password.text, _email.text);
                      if (result == 200) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainMenu(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainMenu(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'register',
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
                        // amber
                        color: Color.fromARGB(255, 243, 106, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            child: Flexible(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  "Login ",
                  style: TextStyle(
                    color: Color.fromARGB(209, 246, 255, 0),
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    shadows: <Shadow>[
                      Shadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        offset: Offset(7.0, 2.0),
                      )
                    ],
                    fontFamily: 'Pacific',
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: CustomPaint(
              size: const Size(600, 247),
              painter: Curvedpainter(),
            ),
          )
        ],
      ),
    );
  }
}

//painter
class Curvedpainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
