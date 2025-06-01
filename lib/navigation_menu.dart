import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:library_app/features/authentication/controllers/borrowed_books_contoller.dart';
import 'package:library_app/features/authentication/screens/home.dart';
import 'package:library_app/utilities/constants/colors.dart';
import 'package:library_app/features/authentication/screens/profile_screen.dart';
import 'package:library_app/features/authentication/screens/borrowed_books_view.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          indicatorColor: Fcolors.black.withOpacity(0.2),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.book_1), label: 'Read Books'),
            NavigationDestination(icon: Icon(Iconsax.book), label: 'Return Book'),
          ],
        ),
      ),
      body:  Obx(
        () => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final BorrowedBooksContoller borrowedBooksContoller =
      Get.put(BorrowedBooksContoller());

  final screens = [
    const HomeScreen(),
   Borrowedbooksview(),
    Profile(
      borrowedBooks: Get.find<BorrowedBooksContoller>().borrowedBooks,
    )
  ];
}
