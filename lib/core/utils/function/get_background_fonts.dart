import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';

Future<List<String>> getFontsInBackground() async {
  return compute((_) {
    final fonts = GoogleFonts.asMap().keys.take(100).toList()..sort();
    return fonts;
  }, null);
}