import 'package:flutter/material.dart';

class FAppbartheme{
  FAppbartheme._();

  static const appbartheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 25),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 25),
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
  );
}