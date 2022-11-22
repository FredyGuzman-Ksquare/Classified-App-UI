import 'package:flutter/material.dart';
import 'package:flutter_project/screens/createAdScreen.dart';
import 'package:flutter_project/screens/editProfileScreen.dart';
import 'package:flutter_project/screens/imageViewerScreen.dart';
import 'package:flutter_project/screens/registerScreen.dart';
import 'package:flutter_project/screens/loginScreen.dart';
import 'package:flutter_project/screens/settingsScreen.dart';
import 'package:go_router/go_router.dart';
import '../screens/editAdScreen.dart';
import '../screens/homeScreen.dart';
import '../screens/loginScreen2.dart';
import '../screens/myAddsScreen.dart';
import '../screens/productDetailScreen.dart';

class RouteGenerator {
  var generateRoute = ((settings) {
    var routeName = settings.name;
    var args = settings.arguments;
    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/login':
        return MaterialPageRoute(builder: (context) => LoginScreen1());

      case '/settings':
        return MaterialPageRoute(builder: (context) => SettingsScreen());

      case '/editprofile':
        return MaterialPageRoute(
            builder: (context) => EditProfileScreen(
                  data: args,
                ));

      case '/myads':
        return MaterialPageRoute(builder: (context) => MyAdsScreen());

      case '/register':
        return MaterialPageRoute(builder: (context) => RegisterScreen());

      case '/createad':
        return MaterialPageRoute(builder: (context) => CreateAdScreen());

      case '/productdetail':
        return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: args));

      case '/editad':
        return MaterialPageRoute(
            builder: (context) => EditAdScreen(product: args));

      case '/imageviewer':
        return MaterialPageRoute(
            builder: (context) => ImageViewerScreen(images: args));
    }
  });
}
