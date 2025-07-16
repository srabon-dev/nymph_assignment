import '../core_export.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    const TextTheme(
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: AppConstant.fontW600,
        color: AppColors.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: AppConstant.fontW500,
        color: AppColors.textPrimary,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 0,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: AppConstant.fontW600,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.surface,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.surface,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.surface,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: AppColors.error,
      ),
    ),
    hintStyle: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColors.textPrimary.withValues(alpha: 0.7),
    ),
    labelStyle: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColors.textPrimary,
    ),
    errorStyle: GoogleFonts.poppins(
      fontSize: 12,
      color: AppColors.error,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      textStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: AppConstant.fontW500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
    ),
  ),
);