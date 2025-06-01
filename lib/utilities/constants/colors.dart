import 'package:flutter/material.dart';


class Fcolors{
  Fcolors._();

  //APP COLORS:
  static const Color primarycolor = Color(0xFF03A9F4);
  static const Color seconadary = Color(0xFFFFFFFF);
  static const Color accents = Color(0xFFE57373);


  //Gradient Colors:
  static const Gradient lineargradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [
    Color(0xFF80D8FF),
    Color(0XFF40C4FF),
    Color(0XFF0091EA),
  ]);


//Text Colors:
  static const Color textprimary = Color(0xFF333333);
  static const Color textsecondary = Color(0xFF6C757D);
  static const Color textwhite = Colors.white;



//Background Colors:
  static const Color primaryBG = Color(0xFFF3F5FF);
  static const Color standard = Color(0xFFF6F6F6);


//BACKGROUND CONTAINER COLOR:
  static const Color normalcontainer = Color(0xFFF6F6F6);  

//BUTTON COLORS:
static const Color buttonp = Color(0xFF4b68ff);
static const Color buttons = Color(0xFF6C757D);


//Border Colors:
  static const Color borderprim = Color(0xFFD9D9D9);
  static const Color boredersec = Color(0xFFE6E6E6);

//ERROR & VALIDATION COLORS:
static const Color error = Color(0xFFD32F2F);
static const Color warning = Color(0xFFF57C00);
static const Color sucess = Color(0xFF388E3C);


  //Neutral Colors:
  static const Color black = Color(0xFF232323);
  static const Color maxgrey = Color(0xFF4F4F4F);
  static const Color dgrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softgrey = Color(0xFFF4F4F4);
  static const Color lgrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}

