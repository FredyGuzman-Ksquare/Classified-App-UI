import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/user.dart';
import '../utils/alert_manager.dart';
import '../utils/constants.dart';

class AuthService {
  void register(context, User user) async {
    var url = Uri.parse("${Constants().serverUrl}/auth/register");
    var userObj = user.toJson();
    try {
      var resp = await http.post(url,
          body: jsonEncode(userObj),
          headers: {'Content-Type': 'application/json'});
      var respObj = jsonDecode(resp.body);
      //print(respObj['status']);

      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        //print(userObj);
        //print('userdata enviado al server');
        AlertManager().displaySnackbar(context, 'Successful Register');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(context, User user) async {
    var storage = const FlutterSecureStorage();
    var url = Uri.parse("${Constants().serverUrl}/auth/login");
    //print('push en login');
    var userObj = user.toJson();
    try {
      var resp = await http.post(url,
          body: jsonEncode(userObj),
          headers: {'Content-Type': 'application/json'});
      var respObj = jsonDecode(resp.body);
      //print(respObj['status']);
      if (respObj['status'] == false) {
        AlertManager().displaySnackbar(context, respObj['message']);
      }
      if (respObj['status'] == true) {
        storage.write(key: 'userId', value: respObj['data']['user']['_id']);
        storage.write(key: 'token', value: respObj['data']['token']);
        // storage.write(
        //     key: 'refreshToken', value: respObj['data']['refreshToken']);
        AlertManager().displaySnackbar(context, respObj['message']);
        Navigator.pushNamed(context, '/');
      }
    } catch (e) {
      print(e);
    }
  }
}
