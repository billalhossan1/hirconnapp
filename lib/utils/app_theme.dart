import 'package:flutter/material.dart';
import 'package:hirconn_app/constant/app_constant.dart';
import '../constant/app_colors.dart';

ThemeData appThemeData = ThemeData(
  fontFamily: AppConstant.instance.font,
  scaffoldBackgroundColor: Color(0xffFFFFFF),

  dividerColor: AppColors.instance.transparent,
  colorScheme: ColorScheme(brightness: Brightness.light, primary: AppColors.instance.primary, onPrimary: Colors.white, secondary: AppColors.instance.boxBg, onSecondary: Colors.black, error: Colors.red, onError: Colors.white, surface: AppColors.instance.boxBg, onSurface: Colors.black),

  appBarTheme: AppBarTheme(backgroundColor: AppColors.instance.white50),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: AppColors.instance.hintText,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    fillColor: AppColors.instance.boxBg,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.error)),
    focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.error)),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.instance.white50,
    iconColor: AppColors.instance.white50,
    shadowColor: AppColors.instance.white50,
    surfaceTintColor: AppColors.instance.white50,
    elevation: 0,
  ),
  buttonTheme: ButtonThemeData(hoverColor: AppColors.instance.transparent, highlightColor: AppColors.instance.transparent),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(AppColors.instance.transparent), mouseCursor: WidgetStatePropertyAll(MouseCursor.defer))),
  textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(AppColors.instance.transparent), mouseCursor: WidgetStatePropertyAll(MouseCursor.defer))),
// );

);


// ThemeData.light(useMaterial3: true).copyWith(
//   scaffoldBackgroundColor: AppColors.instance.white50,
//
//   dividerColor: AppColors.instance.transparent,
//
//   appBarTheme: AppBarTheme(backgroundColor: AppColors.instance.white50),
//   inputDecorationTheme: InputDecorationTheme(
//     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
//     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
//     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.border)),
//     errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.error)),
//     focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.instance.error)),
//   ),
//   popupMenuTheme: PopupMenuThemeData(
//     color: AppColors.instance.white50,
//     iconColor: AppColors.instance.white50,
//     shadowColor: AppColors.instance.white50,
//     surfaceTintColor: AppColors.instance.white50,
//     elevation: 0,
//   ),
//   buttonTheme: ButtonThemeData(hoverColor: AppColors.instance.transparent, highlightColor: AppColors.instance.transparent),
//   elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(AppColors.instance.transparent), mouseCursor: WidgetStatePropertyAll(MouseCursor.defer))),
//   textButtonTheme: TextButtonThemeData(style: ButtonStyle(overlayColor: WidgetStatePropertyAll(AppColors.instance.transparent), mouseCursor: WidgetStatePropertyAll(MouseCursor.defer))),
// );
