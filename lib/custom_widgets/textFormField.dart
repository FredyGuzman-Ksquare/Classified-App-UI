import 'package:flutter/material.dart';
import '../utils/strings.dart';

class CustomTextForm {
  emailTextField(_emailCtrl) {
    return TextField(
      controller: _emailCtrl,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
          labelText: Strings.email,
          labelStyle: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 230, 230, 230),
              fontWeight: FontWeight.w500)),
    );
  }

  TextFormField generalTextField(TextEditingController ctrl, String label) {
    return TextFormField(
      controller: ctrl,
      validator: CustomTextForm().emptyValidator(),
      decoration: textFieldDecoration(getLabel(label)),
    );
  }

  TextFormField generalTextFieldFilled(
      TextEditingController ctrl, String initValue, String label) {
    return TextFormField(
      initialValue: initValue,
      controller: ctrl,
      validator: CustomTextForm().emptyValidator(),
      decoration: textFieldDecoration(getLabel(label)),
    );
  }

  passwordTextField(ctrl) {
    return TextFormField(
      controller: ctrl,
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      validator: CustomTextForm().emptyValidator(),
      decoration: textFieldDecoration(getLabel('pass')),
    );
  }

  textFieldDecoration(text) {
    return InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        labelText: text,
        labelStyle: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 230, 230, 230),
            fontWeight: FontWeight.w500));
  }

  emptyValidator() => (value) {
        if (value!.isEmpty) {
          return "This is required";
        }
      };

  passwordValidator() => (value) {
        if (value!.isEmpty) {
          return "This is required";
        }
        if (value.length < 6) {
          return "Password must be 6 chars";
        }
      };

  String getLabel(String label) {
    switch (label) {
      case 'email':
        return Strings.email;
      case 'pass':
        return Strings.password;
      case 'phone':
        return Strings.mobile;
      case 'contact':
        return Strings.contactNumber;
      case 'name':
        return Strings.name;
      case 'title':
        return Strings.title;
      case 'price':
        return Strings.price;
      case 'description':
        return Strings.description;
      default:
        return "Write something";
    }
  }
}
