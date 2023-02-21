import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.buttonColor});
  String text;
  Color textColor;
  Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: buttonColor,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.circular(10)),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 20),
        ));
  }
}
