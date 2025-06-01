import 'package:flutter/material.dart';

class FTextfieldtheme{
  FTextfieldtheme._();

  static InputDecorationTheme normaldecorationtheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    labelStyle: const TextStyle().copyWith(fontSize: 15, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 15, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.5)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: Colors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: Colors.black12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 2, color: Colors.orange),
    ),
  );  
}