import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/customButton.dart';
import 'package:go_router/go_router.dart';

import '../custom_widgets/circularProgressIndicator.dart';
import '../custom_widgets/customText.dart';
import '../custom_widgets/textFormField.dart';
import '../model/user.dart';
import '../services/auth.dart';
import '../utils/strings.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void register() async {
    if (_formKey.currentState!.validate()) {
      User user = User(
          name: _nameCtrl.text,
          email: _emailCtrl.text,
          mobile: _mobileCtrl.text,
          password: _passwordCtrl.text);
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() {
        AuthService().register(context, user);
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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 260,
              width: double.infinity,
              child: const Image(
                image: AssetImage('graphics/flowers.jpg'),
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: CustomTextForm().generalTextField(_emailCtrl, 'name'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: CustomTextForm().generalTextField(_emailCtrl, 'email'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: CustomTextForm().generalTextField(_mobileCtrl, 'phone'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: CustomTextForm().passwordTextField(_passwordCtrl),
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
                  onPressed: () {
                    register();
                  },
                  style: CustomButton().loginRegisterButton(_isLoading),
                  child: CustomCircularProgress()
                      .customCPIContainer(_isLoading, false),
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
                    Navigator.pushNamed(context, "/login");
                  },
                  style: ButtonStyle(
                    padding: CustomButton().buttonPadding(),
                  ),
                  child: CustomText().accountText(false),
                ),
              ),
            ),
          ]),
    );
  }
}
