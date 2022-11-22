import 'package:flutter/material.dart';

import '../utils/strings.dart';

class CustomButton {
  buttonPadding() {
    return MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.only(top: 10, bottom: 10, right: 25, left: 25));
  }

  loginRegisterButton(_loading) {
    return ButtonStyle(
      padding: buttonPadding(),
      backgroundColor: _loading
          ? MaterialStateProperty.all<Color>(Color.fromARGB(255, 104, 104, 104))
          : MaterialStateProperty.all<Color>(const Color(0xffF25723)),
    );
  }

  AccountButton(_login) {
    return ButtonStyle(
      padding: buttonPadding(),
    );
  }

  customOrangeButton() {
    return ButtonStyle(
      padding: buttonPadding(),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xffF25723)),
    );
  }
}
