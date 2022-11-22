import 'package:flutter/material.dart';
import 'package:flutter_project/custom_widgets/customText.dart';

import '../utils/strings.dart';

class CustomCircularProgress {
  customCPI() {
    return CircularProgressIndicator(
      color: Color.fromARGB(253, 241, 135, 100),
      strokeWidth: 3,
    );
  }

  customBlackCPI() {
    return CircularProgressIndicator(
      color: Color.fromARGB(252, 39, 39, 39),
      strokeWidth: 3,
    );
  }

  customCPIContainer(_loading, _login) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_loading)
          Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(right: 10),
            child: customCPI(),
          ),
        CustomText().loginRegisterText(_loading, _login)
      ],
    );
  }

  customCPIContainerText(_loading, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_loading)
          Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.only(right: 10),
            child: customCPI(),
          ),
        CustomText().customOrangeText(text)
      ],
    );
  }
}
