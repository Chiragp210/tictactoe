import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants{
  static Color homeBackground = const Color(0x4DA41A1A);
  static Color border = const Color(0x4DF8F8F8);
  static Color textColor = Colors.white;


  static TextStyle textStyle = TextStyle(color: textColor,fontSize: 30);

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
}