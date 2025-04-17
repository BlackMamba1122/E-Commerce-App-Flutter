import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/appbar_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/chip_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/outline_bottom_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/text_field_theme.dart';
import 'package:flutter_application_1/utils/theme/custom_theme/text_theme.dart';

class BAppTheme {
  BAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    textTheme: BTextTheme.lightTextTheme,
    chipTheme: BchipTheme.lightchipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: BAppBarTheme.lightAppBarTheme,
    checkboxTheme: BCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: BBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: BElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: BTextFormFieldTheme.lightInputDecorationTheme,
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.orange,
    textTheme: BTextTheme.darkTextTheme,
    chipTheme: BchipTheme.darkchipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: BAppBarTheme.darkAppBarTheme,
    checkboxTheme: BCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: BBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: BElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: BOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: BTextFormFieldTheme.darkInputDecorationTheme,
  );


}