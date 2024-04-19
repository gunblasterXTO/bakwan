import 'package:bakwan/common/style/ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: UIConst.white,
      elevation: 0.0,
      surfaceTintColor: UIConst.white,
    ),
    textTheme: GoogleFonts.ralewayTextTheme(),
  );
}
