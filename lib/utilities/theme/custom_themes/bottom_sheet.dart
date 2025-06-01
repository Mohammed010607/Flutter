import 'package:flutter/material.dart';

class FbottomsheetTheme{
  FbottomsheetTheme._();

  static BottomSheetThemeData normalbottomsheettheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );
}