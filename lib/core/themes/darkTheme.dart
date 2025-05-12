import 'package:deliveryapp/core/localizatoin/changeLocal.dart';
import 'package:deliveryapp/core/themes/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeData DarkTheme() {
  LocaleController controller = Get.put(LocaleController());
  return ThemeData(
    hoverColor: AppDarkColors.cardColor,
    shadowColor: AppDarkColors.BackgroundbuttonColor,
    cardColor: AppDarkColors.cardColor,
    dialogBackgroundColor: AppDarkColors.dialogBackgroundColor,
    fontFamily: controller.language == "ar" ? "cairo" : "lato",
    appBarTheme: AppBarTheme(
        color: AppDarkColors.BackgroundbuttonColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontSize: 22,
            color: AppDarkColors.titleAppbar,
            fontWeight: FontWeight.bold)),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppDarkColors.primaryColor,
        onPrimary: AppDarkColors.onPrimary,
        secondary: AppDarkColors.secondaryColor,
        onSecondary: AppDarkColors.onSecondary,
        error: AppDarkColors.errorColor,
        onError: AppDarkColors.onError,
        surface: AppDarkColors.surface,
        onSurface: AppDarkColors.onSurface),
    scaffoldBackgroundColor: AppDarkColors.BackgroundbuttonColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(
        fontSize: 12,
      ),
      filled: true,
      fillColor: AppDarkColors.surface, // تعيين لون الخلفية للحقول
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppDarkColors.primaryColor), // تعيين لون الحدود للحقول
        borderRadius: BorderRadius.circular(8), // تعيين الزوايا المدورة
      ),
      hintStyle: TextStyle(
          color: AppDarkColors.onSurface), // تعيين لون النصوص في الـ hint
      labelStyle: TextStyle(
          color: AppDarkColors.onSurface), // تعيين لون النصوص في الـ label
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor:
          AppDarkColors.primaryColor, // تعيين اللون الخلفي للـ SnackBar
      contentTextStyle: TextStyle(
        color: AppDarkColors.onPrimary, // تعيين لون النص في الـ SnackBar
      ),
    ),
    dividerTheme: DividerThemeData(
      color:
          AppDarkColors.onSurface.withOpacity(0.5), // تعيين لون الخطوط الفاصلة
      thickness: 1,
      space: 16,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppDarkColors
          .primaryColor, // تعيين اللون الخلفي للـ BottomNavigationBar
      selectedItemColor: AppDarkColors.onPrimary, // تعيين لون العناصر المحددة
      unselectedItemColor:
          AppDarkColors.onSurface, // تعيين لون العناصر الغير محددة
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppDarkColors.primaryColor, // تعيين لون النص في الـ Tab
      unselectedLabelColor:
          AppDarkColors.onSurface, // تعيين لون النص الغير محدد في الـ Tab
      indicatorSize: TabBarIndicatorSize.label, // تخصيص حجم المؤشر
      indicatorColor: AppDarkColors.primaryColor, // تعيين لون المؤشر
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppDarkColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
