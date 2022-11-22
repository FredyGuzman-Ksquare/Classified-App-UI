import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../model/user.dart';
import '../utils/alert_manager.dart';
import '../utils/constants.dart';

class ProfileService {
  Future<Map> myUserPost() async {
    var storage = const FlutterSecureStorage();
    Map userData;
    var url = Uri.parse("${Constants().serverUrl}/user/profile");
    var token = await storage.read(key: 'token');
    var resp = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    var respJson = jsonDecode(resp.body);
    userData = respJson['data'];
    return userData;
  }

  Future<Map> myUserPatch(context, User user) async {
    var storage = const FlutterSecureStorage();
    Map userData;
    var url = Uri.parse("${Constants().serverUrl}/user");
    var token = await storage.read(key: 'token');
    var resp = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(user.toJson()),
    );

    var respJson = jsonDecode(resp.body);
    var patchData = respJson['data'];
    userData = patchData;

    if (respJson['status'] == true) {
      AlertManager().displaySnackbar(context, 'Successful Update User');
      Navigator.pushNamed(context, '/settings');
    }
    if (respJson['status'] == false) {
      AlertManager().displaySnackbar(context, 'Error = ${resp.statusCode}');
    }
    return userData;
  }
}
