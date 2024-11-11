import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle textStyle20 =
      GoogleFonts.aboreto(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle textStyle18 = const TextStyle(fontSize: 18);

  static TextStyle textStyle14 = const TextStyle(
    color: Colors.white30,
    fontSize: 14,
  );

  static TextStyle textStyle16 =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}
