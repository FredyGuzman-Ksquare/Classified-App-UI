import 'package:flutter/material.dart';

import '../custom_widgets/circularProgressIndicator.dart';
import '../custom_widgets/customButton.dart';
import '../custom_widgets/customText.dart';
import '../custom_widgets/textFormField.dart';
import '../model/user.dart';
import '../services/auth.dart';
import '../services/profile.dart';
import '../utils/strings.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  State<LoginScreen1> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen1> {
  final TextEditingController _emailCtrl =
      TextEditingController(text: Strings.profileEmail);
  final TextEditingController _passwordCtrl =
      TextEditingController(text: "252525");
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void login() async {
    if (_formKey.currentState!.validate()) {
      User user = User(email: _emailCtrl.text, password: _passwordCtrl.text);
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        AuthService().login(context, user);
        _isLoading = false;
      });
    }
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 340,
              width: double.infinity,
              child: Image.asset("graphics/flowers.jpg", fit: BoxFit.cover),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 5),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextForm().generalTextField(_emailCtrl, 'email'),
                        const SizedBox(
                          height: 12,
                        ),
                        CustomTextForm().passwordTextField(_passwordCtrl),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: CustomButton()
                                  .loginRegisterButton(_isLoading),
                              child: CustomCircularProgress()
                                  .customCPIContainer(_isLoading, true),
                              onPressed: () {
                                login();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              style: ButtonStyle(
                                  padding: CustomButton().buttonPadding()),
                              child: CustomText().accountText(true)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
