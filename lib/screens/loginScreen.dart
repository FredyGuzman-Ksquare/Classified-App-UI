import 'package:flutter/material.dart';
import 'package:flutter_project/screens/homeScreen.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: double.infinity,
              child: const Image(
                image: AssetImage('graphics/butterfly.jpg'),
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: _emailCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: TextField(
                controller: _passwordCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 230, 230, 230),
                        fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 15, bottom: 15, right: 25, left: 25)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffF25723)),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 15, bottom: 15, right: 25, left: 25)),
                  ),
                  child: const Text(
                    "Don't have any account?",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffF25723)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ]),
    );
  }
}
