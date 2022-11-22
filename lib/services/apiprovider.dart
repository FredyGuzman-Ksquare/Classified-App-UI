import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../utils/alert_manager.dart';
import '../utils/constants.dart';

class ApiProvider {
  var storage = FlutterSecureStorage();

  Future<String> _getToken() async {
    var token = await storage.read(key: 'token');
    return token.toString();
  }

  Future<Map<String, String>> _getHeaders() async {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${await _getToken()}'
    };
  }

  Future post(endpoint, body, context) async {
    var responseJson;
    var requestURL = Uri.parse("${Constants().serverUrl}$endpoint");
    try {
      var response = await http.post(
        requestURL,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );
      responseJson = _handleResponse(response);
      if (responseJson['status'] == true) {
        AlertManager().displaySnackbar(context, "Successful Ad Creation");
        //Navigator.pop(context);
        Navigator.pushNamed(context, '/settings');
      }
      if (responseJson['status'] == false) {
        AlertManager().displaySnackbar(context, "Error ${response.statusCode}");
      }
    } catch (e) {
      print("error");
      print(e);
    }
    //print(responseJson);
    return responseJson;
  }

  Future patch(endpoint, body, context) async {
    var responseJson;
    var requestURL = Uri.parse("${Constants().serverUrl}$endpoint");
    try {
      var response = await http.patch(
        requestURL,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );
      responseJson = _handleResponse(response);
      if (responseJson['status'] == true) {
        AlertManager().displaySnackbar(context, "Successful Ad Uppdate");
        Navigator.pushNamed(context, '/myads');
      }
      if (responseJson['status'] == false) {
        AlertManager().displaySnackbar(context, "Error ${response.statusCode}");
      }
    } catch (e) {
      print("error");
      print(e);
    }
    return responseJson;
  }

  Future delete(endpoint, body, context) async {
    var responseJson;
    var requestURL = Uri.parse("${Constants().serverUrl}$endpoint");
    try {
      var response = await http.delete(
        requestURL,
        headers: await _getHeaders(),
        body: jsonEncode(body),
      );
      responseJson = _handleResponse(response);
      if (responseJson['status'] == true) {
        AlertManager().displaySnackbar(context, "Successful Ad Deleted");
        Navigator.pushNamed(context, '/myads');
      }
      if (responseJson['status'] == false) {
        AlertManager().displaySnackbar(context, "Error ${response.statusCode}");
      }
    } catch (e) {
      print("error");
      print(e);
    }
    return responseJson;
  }

  _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 401:
        return {'message': 'invalid request'};
      case 403:
        return {'message': 'UnAuthorized'};
      case 500:
        return {'message': 'Server Error'};
      default:
        return {'message': 'Unknown Error'};
    }
  }
}