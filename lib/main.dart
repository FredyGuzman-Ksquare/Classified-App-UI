import 'package:flutter/material.dart';
import 'package:flutter_project/screens/editAdScreen.dart';
import 'package:flutter_project/screens/editProfileScreen.dart';
import 'package:flutter_project/screens/homeScreen.dart';
import 'package:flutter_project/screens/registerScreen.dart';
import 'package:flutter_project/screens/myAddsScreen.dart';
import 'package:flutter_project/styles/theme.dart';

import 'navigation/routerCopy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme().theme,
      home: HomeScreen(),
      initialRoute: "/login",
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
