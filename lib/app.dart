import 'package:flutter/material.dart';
import 'package:library_app/features/authentication/screens/login.dart';
import 'package:library_app/utilities/theme/theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MEC Library',
      theme: FAppTheme.normal,
      home:  Loginscreen(),
    );
  }
}
