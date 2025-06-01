import 'package:flutter/material.dart';

class FoutlinedbuttonTheme{
  FoutlinedbuttonTheme._();

  static final outlinedbuttontheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.blue),
      textStyle: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    )
  );
}