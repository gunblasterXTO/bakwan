import 'package:flutter/material.dart';

class UIConst {
  UIConst._();

  // Color
  static Color primaryColor = const Color.fromRGBO(0, 71, 27, 1.0);
  static Color secondaryColor = const Color.fromRGBO(240, 235, 219, 1.0);
  static Color white = Colors.white;
  static Color hintTextColor = Colors.grey;
  static Color formValueTextColor = Colors.black;
  static Color borderGreyColor = Colors.grey.withOpacity(0.3);
  static Color errorWidgetBackground = const Color.fromARGB(255, 255, 130, 130);
  static Color errorWidgetText = Colors.white;

  // Time
  static int pageTransitionDuration = 200; // milliseconds

  // Config
  static double appBarHeight = 64.0;
  static double standardPadding = 8.0;
  static double standardGapHeight = 8.0;
  static double standardRad = 8.0;
  static double standardSpacing = 4.0;
}
