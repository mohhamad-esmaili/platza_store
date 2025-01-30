import 'package:flutter/material.dart';

extension TextfieldExtension on TextField {
  TextField platzaTextField({String? textFieldLabel}) {
    return TextField(
      autocorrect: true,
      decoration: InputDecoration(
        labelText: textFieldLabel,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Color(0xffFF7A00),
          ),
        ),
      ),
    );
  }
}

extension TextFormDecoration on InputDecoration {
  InputDecoration platzaInputDecoration({
    String? textFieldLabel,
    Function? validator,
    Widget? suffixWidget,
  }) {
    return InputDecoration(
      labelText: textFieldLabel,
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      suffixIcon: suffixWidget,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xffFF7A00),
        ),
      ),
    );
  }
}
