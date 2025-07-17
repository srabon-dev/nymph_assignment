import '../../core_export.dart';

TextStyle safeGoogleFont({required String fontName, required double fontSize, required Color color}) {
  try {
    return GoogleFonts.getFont(
      fontName,
      fontSize: fontSize,
      color: color,
    );
  } catch (_) {
    return GoogleFonts.getFont(
      AppConstant.defaultFont,
      fontSize: fontSize,
      color: color,
    );
  }
}
