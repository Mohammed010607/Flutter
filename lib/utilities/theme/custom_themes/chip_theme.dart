import 'package:flutter/material.dart';

class   FChipTheme{
  FChipTheme._();

  static ChipThemeData chiptheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsetsDirectional.symmetric(horizontal:12, vertical: 12),
    checkmarkColor: Colors.white,
  );
}