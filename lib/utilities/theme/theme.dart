import 'package:flutter/material.dart';
import 'package:library_app/utilities/theme/custom_themes/text_theme.dart';
import 'package:library_app/utilities/theme/custom_themes/elevated_button.dart';
import 'package:library_app/utilities/theme/custom_themes/appbar_theme.dart';
import 'package:library_app/utilities/theme/custom_themes/chip_theme.dart';
import 'package:library_app/utilities/theme/custom_themes/outlined_button.dart';
import 'package:library_app/utilities/theme/custom_themes/text_field.dart';
import 'package:library_app/utilities/theme/custom_themes/checkbox.dart';
import 'package:library_app/utilities/theme/custom_themes/bottom_sheet.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData normal = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: FTextTheme.normalTextTheme,
    chipTheme: FChipTheme.chiptheme,
    appBarTheme: FAppbartheme.appbartheme,
    checkboxTheme: FCheckboxTheme.normalcheckboxtheme,
    bottomSheetTheme: FbottomsheetTheme.normalbottomsheettheme,
    elevatedButtonTheme: FElevatedButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: FoutlinedbuttonTheme.outlinedbuttontheme,
    inputDecorationTheme: FTextfieldtheme.normaldecorationtheme,
  );
}
