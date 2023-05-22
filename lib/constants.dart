import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  // ignore: constant_identifier_names
  static const Color PRIMARY_COLOR = Color(0xFFFEF4E8);
  // ignore: constant_identifier_names
  static const Color SECONDARY_COLOR = Color(0xFF970747);
  static final ButtonStyle style = ElevatedButton.styleFrom(
    backgroundColor: SECONDARY_COLOR,
    foregroundColor: PRIMARY_COLOR,
    textStyle: const TextStyle(fontSize: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // <-- Radius
    ),
  );
  static bool isEmail({required email}) {
    var regEx = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regEx.hasMatch(email);
  }

  static Widget getLogo({double? height, double? width}) => SizedBox(
        height: height ?? 200,
        width: width ?? 200,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'lib/assets/images/logo.png',
            width: 200.0,
            height: 200.0,
            fit: BoxFit.fill,
          ),
        ),
      );
}
