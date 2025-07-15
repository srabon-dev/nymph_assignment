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
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: AppConstant.fontW600,
        color: AppColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: AppConstant.fontW600,
        color: AppColors.textPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: AppConstant.fontW600,
        color: AppColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        fontWeight: AppConstant.fontNormal,
        color: AppColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: AppConstant.fontNormal,
        color: AppColors.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: AppConstant.fontNormal,
        color: AppColors.textPrimary,
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.surface,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    hintStyle: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColors.textPrimary.withValues(alpha: 0.7),
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