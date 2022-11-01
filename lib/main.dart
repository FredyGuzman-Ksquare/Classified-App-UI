import 'package:flutter/material.dart';
import 'package:flutter_project/screens/editAdScreen.dart';
import 'package:flutter_project/screens/editProfileScreen.dart';
import 'package:flutter_project/screens/homeScreen.dart';
import 'package:flutter_project/screens/loginScreen.dart';
import 'package:flutter_project/screens/myAddsScreen.dart';
import 'package:flutter_project/styles/theme.dart';

import 'navigation/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme,
      routerConfig: router,
    );
    /* debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      theme: CustomTheme().theme,
      home: MyAdsScreen(), */
  }
}
