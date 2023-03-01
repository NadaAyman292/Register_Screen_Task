import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild(
      {this.obsecure = false,
      this.suffixIcon,
      required this.textInputType,
      required this.hinttext,
      required this.prefixIcon,
      required this.labeltext,
      required this.validator,
      required this.controller});
  TextInputType textInputType;
  String hinttext;
  String labeltext;
  IconData prefixIcon;
  bool? obsecure;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obsecure!,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.purple,
              ),
            ),
            prefixIcon: Icon(prefixIcon),
            prefixIconColor: Colors.purple,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: () {},
                    icon: suffixIcon!,
                  )
                : null,
            suffixIconColor: Colors.purple,
            hintText: hinttext,
            labelStyle: TextStyle(color: Colors.purple),
            labelText: labeltext),
      ),
    );
  }
}
