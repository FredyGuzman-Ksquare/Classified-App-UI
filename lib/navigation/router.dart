import 'package:flutter/material.dart';
import 'package:flutter_project/screens/createAdScreen.dart';
import 'package:flutter_project/screens/editProfileScreen.dart';
import 'package:flutter_project/screens/registerScreen.dart';
import 'package:flutter_project/screens/loginScreen.dart';
import 'package:go_router/go_router.dart';
import '../screens/editAdScreen.dart';
import '../screens/homeScreen.dart';
import '../screens/myAddsScreen.dart';

final router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: LoginScreen(),
      );
    },
  ),
  GoRoute(
    path: '/Register',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: RegisterScreen(),
      );
    },
  ),
  GoRoute(
    path: '/Home',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: HomeScreen(),
      );
    },
  ),
  GoRoute(
    path: '/Settings',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: HomeScreen(),
      );
    },
  ),
  GoRoute(
    path: '/EditProfile',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: EditProfileScreen(),
      );
    },
  ),
  GoRoute(
    path: '/MyAdds',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: MyAdsScreen(),
      );
    },
  ),
  GoRoute(
    path: '/EditAd',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: EditAdScreen(
            //data: state.extra as Map,
            ),
      );
    },
  ),
  GoRoute(
    path: '/ProductDetail',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: EditAdScreen(
            //data: state.extra as Map,
            ),
      );
    },
  ),
  GoRoute(
    path: '/CreateAd',
    pageBuilder: (context, state) {
      return MaterialPage(
        child: CreateAdScreen(),
      );
    },
  ),
]);
