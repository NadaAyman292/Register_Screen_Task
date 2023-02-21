import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild(
      {required this.obsecure,
      this.suffixIcon,
      required this.textInputType,
      required this.hinttext,
      required this.prefixIcon,
      required this.labeltext});
  TextInputType textInputType;
  String hinttext;
  String labeltext;
  Icon prefixIcon;
  bool obsecure;
  Icon? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure,
      keyboardType: textInputType,
      decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 231, 226, 226),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 231, 226, 226),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.purple,
          suffixIcon: suffixIcon,
          suffixIconColor: Colors.purple,
          hintText: hinttext,
          labelStyle: TextStyle(color: Colors.purple),
          labelText: labeltext),
    );
  }
}
