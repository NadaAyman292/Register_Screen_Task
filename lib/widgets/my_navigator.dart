import 'package:flutter/material.dart';

Future MyNavigator({
  required BuildContext context,
  required Widget widget,
}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}
