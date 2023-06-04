// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_import

import 'dart:convert';

import 'package:app/pages/Models/JournalModel.dart';
import 'package:app/pages/Models/signup.dart';
import 'package:app/pages/Models/tokens.dart';
import 'package:app/pages/Models/user_created.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import 'DateSubmitModel.dart';
import 'LoginModel.dart';

late var Current_user;
late var Accestoken;
late var RefreshToken;
late var Password;

class Authenticaton {
  Future<dynamic> login(String username, String password) async {
    const String BaseUri = "http://10.0.2.2:5000/auth";

    var url = Uri.parse(BaseUri + "/login");

    var client = http.Client();

    var login = Login(
      username: username,
      password: password,
    );

    var payload = json.encode(login);

    var header = {'Content-Type': 'application/json'};

    var response = await client.post(url, body: payload, headers: header);

    Token result = Token.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      Accestoken = result.accessToken;
      RefreshToken = result.refreshToken;
      Current_user = result.username;
      Password = password;
      return response.statusCode;
    }
    return 404;
  }

  // SIGNUP
  Future<dynamic> SignUp(String Username, String Password, String Email) async {
    const String BaseUri = "http://10.0.2.2:5000/auth";

    var url = Uri.parse(BaseUri + "/signup");

    var client = http.Client();

    var signup = Signin(
      email: Email,
      username: Username,
      password: Password,
    );

    var payload = json.encode(signup);

    var header = {'Content-Type': 'application/json'};

    var response = await client.post(url, body: payload, headers: header);
    print(Accestoken);
    // user created
    if (response.statusCode == 200) {
      const String BaseUri = "http://10.0.2.2:5000/auth";
      var url = Uri.parse(BaseUri + "/login");
      var client = http.Client();
      var login = Login(username: Username, password: Password);
      var payload = json.encode(login);
      var header = {'Content-Type': 'application/json'};
      var response = await client.post(url, body: payload, headers: header);
      Token result = Token.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        Accestoken = result.accessToken;
        RefreshToken = result.refreshToken;
        Current_user = result.username;
        print(Current_user);
        return 200;
      }
    }
    return 404;
  }
}
