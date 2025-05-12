import 'package:deliveryapp/core/localizatoin/changeLocal.dart';
import 'package:deliveryapp/core/themes/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData lightTheme() {
  LocaleController controller = Get.put(LocaleController());
  return ThemeData(
    scaffoldBackgroundColor: AppLightColors.backgroundColor,
    hoverColor: const Color.fromARGB(18, 9, 141, 228),
    shadowColor: AppLightColors.BackgroundbuttonColor,
    dialogBackgroundColor: AppLightColors.dialogBackgroundColor,
    fontFamily: controller.language == "ar" ? "cairo" : "lato",
    appBarTheme: AppBarTheme(
      color: AppLightColors.appBarColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: AppDarkColors.titleAppbar,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primaryColor,
      onPrimary: AppLightColors.onPrimary,
      secondary: AppLightColors.secondaryColor,
      onSecondary: AppLightColors.onSecondary,
      error: AppLightColors.errorColor,
      onError: AppLightColors.onError,
      surface: AppLightColors.surface,
      onSurface: AppLightColors.onSurface,
    ),
    // cardColor: const Color.fromARGB(123, 255, 255, 255),
    cardColor: AppLightColors.cardColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(fontSize: 12),
      filled: true,
      fillColor: AppLightColors.surface, // تعيين لون الخلفية للحقول
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppLightColors.primaryColor,
        ), // تعيين لون الحدود للحقول
        borderRadius: BorderRadius.circular(8), // تعيين الزوايا المدورة
      ),
      hintStyle: TextStyle(
        color: AppLightColors.onSurface,
      ), // تعيين لون النصوص في الـ hint
      labelStyle: TextStyle(
        color: AppLightColors.onSurface,
      ), // تعيين لون النصوص في الـ label
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor:
          AppLightColors.primaryColor, // تعيين اللون الخلفي للـ SnackBar
      contentTextStyle: TextStyle(
        color: AppLightColors.onPrimary, // تعيين لون النص في الـ SnackBar
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppLightColors.onSurface.withOpacity(
        0.5,
      ), // تعيين لون الخطوط الفاصلة
      thickness: 1,
      space: 16,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:
          AppLightColors
              .primaryColor, // تعيين اللون الخلفي للـ BottomNavigationBar
      selectedItemColor: AppLightColors.onPrimary, // تعيين لون العناصر المحددة
      unselectedItemColor:
          AppLightColors.onSurface, // تعيين لون العناصر الغير محددة
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppLightColors.primaryColor, // تعيين لون النص في الـ Tab
      unselectedLabelColor:
          AppLightColors.onSurface, // تعيين لون النص الغير محدد في الـ Tab
      indicatorSize: TabBarIndicatorSize.label, // تخصيص حجم المؤشر
      indicatorColor: AppLightColors.primaryColor, // تعيين لون المؤشر
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppLightColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
