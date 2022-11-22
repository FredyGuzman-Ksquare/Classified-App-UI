import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/ads.dart';
import '../utils/constants.dart';
import 'apiprovider.dart';

class AdService {
  Future<List<Ad>> fetchUserPosts() async {
    List<Ad> ads = [];
    var url = Uri.parse("${Constants().serverUrl}/ads");
    try {
      var res = await http.get(url);
      var resAsJSON = jsonDecode(res.body);
      var postData = resAsJSON['data'];
      ads = postData.map<Ad>((ad) => Ad.fromJson(ad)).toList();
      return ads;
    } catch (e) {
      print('Error $e');
      return ads;
    }
  }

  Future<List<Ad>> fetchMyPosts() async {
    var storage = const FlutterSecureStorage();
    List<Ad> ads = [];
    var url = Uri.parse("${Constants().serverUrl}/ads/user");
    var token = await storage.read(key: 'token');
    try {
      var resp = await http.post(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      var resAsJSON = jsonDecode(resp.body);
      var adData = resAsJSON['data'];
      ads = adData.map<Ad>((ad) => Ad.fromJson(ad)).toList();
      return ads;
    } catch (e) {
      print("Error $e");
      return ads;
    }
  }

  void createPost(context, Ad ad) async {
    var resp = await ApiProvider().post('/ads', ad.toJson(), context);
    //print(resp['data']);
  }

  void patchPost(Ad ad, context) async {
    var resp =
        await ApiProvider().patch('/ads/${ad.sId}', ad.toJson(), context);
    //print(resp['data']); //respuesta al hacer patch
  }

  void deletePost(Ad ad, context) async {
    var resp =
        await ApiProvider().delete('/ads/${ad.sId}', ad.toJson(), context);
    //print(resp['data']);
  }
}
