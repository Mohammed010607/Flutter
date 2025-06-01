import 'package:flutter/material.dart';

class FCheckboxTheme{
  FCheckboxTheme._();

  static CheckboxThemeData normalcheckboxtheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)){
        return Colors.white;
      }
      else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)){
        return Colors.blue;
      }
      else{
        return Colors.transparent;
      }
    }),
  );
}