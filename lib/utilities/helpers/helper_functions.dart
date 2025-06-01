import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fhelperfuncs {
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    }
    return null;
  }

  static void navigateNextscreen(BuildContext context, Widget screen){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String turncateText(String text, int maxlength){
    if (text.length <= maxlength){
      return text;
    }
    else{
      return '${text.substring(0, maxlength)}';
    }
  }

  static Size screensize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenheight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenwidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

} 
