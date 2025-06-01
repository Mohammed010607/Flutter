import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/features/authentication/controllers/borrowed_books_contoller.dart';
import 'app.dart';

Future<void> signInAnonymously() async {
  try {
    await FirebaseAuth.instance.signInAnonymously();
  } catch (e) {
    // Continue without anonymous
  }
}

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await signInAnonymously();
    
    final controller = Get.put(BorrowedBooksContoller());
    controller.checkduedates();
    
    runApp(const MyApp());
  } catch (e) {
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Cant Start the App: $e'),
        ),
      ),
    ));
  }
}
