import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  // ignore: constant_identifier_names
  static const Color PRIMARY_COLOR = Color(0xFFFEF4E8);
  static Map<int, Color> PRIMARY_COLOR_MAP = {
    50: Color.fromRGBO(254, 244, 232, .1),
    100: Color.fromRGBO(254, 244, 232, .2),
    200: Color.fromRGBO(254, 244, 232, .3),
    300: Color.fromRGBO(254, 244, 232, .4),
    400: Color.fromRGBO(254, 244, 232, .5),
    500: Color.fromRGBO(254, 244, 232, .6),
    600: Color.fromRGBO(254, 244, 232, .7),
    700: Color.fromRGBO(254, 244, 232, .8),
    800: Color.fromRGBO(254, 244, 232, .9),
    900: Color.fromRGBO(254, 244, 232, 1),
  };
  static MaterialColor PRIMARY_COLOR_MATERIAL =
      MaterialColor(0xFFFEF4E8, PRIMARY_COLOR_MAP);
  // ignore: constant_identifier_names
  static const Color SECONDARY_COLOR = Color(0xFF970747);

  static Map<int, Color> SECONDARY_COLOR_MAP = {
    50: Color.fromRGBO(151, 7, 71, .1),
    100: Color.fromRGBO(151, 7, 71, .2),
    200: Color.fromRGBO(151, 7, 71, .3),
    300: Color.fromRGBO(151, 7, 71, .4),
    400: Color.fromRGBO(151, 7, 71, .5),
    500: Color.fromRGBO(151, 7, 71, .6),
    600: Color.fromRGBO(151, 7, 71, .7),
    700: Color.fromRGBO(151, 7, 71, .8),
    800: Color.fromRGBO(151, 7, 71, .9),
    900: Color.fromRGBO(151, 7, 71, 1),
  };
  static MaterialColor SECONDARY_COLOR_MATERIAL =
      MaterialColor(0xFFFEF4E8, SECONDARY_COLOR_MAP);

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

  static String dummyImage =
      'https://lumiere-a.akamaihd.net/v1/images/a_avatarpandorapedia_neytiri_16x9_1098_01_0e7d844a.jpeg?region=0%2C0%2C1920%2C1080&width=768';
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
