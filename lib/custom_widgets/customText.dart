import 'package:flutter/material.dart';

import '../utils/strings.dart';

class CustomText {
  loginRegisterString(_login) {
    return _login ? Strings.login : Strings.registerNow;
  }

  waitingText(_login) {
    return _login ? Strings.startingSession : Strings.registering;
  }

  AccountText(_login) {
    return _login ? Strings.dontHaveAccount : Strings.alreadyHaveAccount;
  }

  loginRegisterText(_loading, _login) {
    return Text(_loading ? waitingText(_login) : loginRegisterString(_login),
        style: TextStyle(
            color: _loading ? const Color(0xffF25723) : Colors.white,
            fontSize: _loading ? 24 : 18,
            fontWeight: FontWeight.w700));
  }

  accountText(_login) {
    return Text(AccountText(_login),
        style: TextStyle(
            color: const Color(0xffF25723),
            fontSize: 24,
            fontWeight: FontWeight.w700));
  }

  customOrangeText(String text) {
    return Text(text,
        style: TextStyle(
            color: const Color(0xffF25723),
            fontSize: 24,
            fontWeight: FontWeight.w700));
  }

  customWhiteText(String text) {
    return Text(text,
        style: TextStyle(
            color: const Color(0xffFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.w700));
  }
}
