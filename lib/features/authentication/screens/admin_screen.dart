import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_app/features/authentication/controllers/borrowed_books_contoller.dart';
import 'package:library_app/features/authentication/screens/login.dart';
import 'package:iconsax/iconsax.dart';
import 'package:library_app/features/authentication/screens/upload_books.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BorrowedBooksContoller>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        leading: IconButton(
          icon: const Icon(Iconsax.logout,
          ),
          onPressed: () {
            Get.offAll(() => Loginscreen());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){Get.to(()=>const Adminupload());      
      },
      child: const Icon(Iconsax.add),
      ),
      body: Padding(
     padding: EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Borrowed Books",
              style: Theme.of(context).textTheme.headlineMedium,
             ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                "Total Borrowed Books: ${controller.borrowedBooks.length}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 21.5),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.borrowedBooks.length,
                  itemBuilder: (context, index) {
                    final book = controller.borrowedBooks[index];
                    return Card(
                      child: ListTile(
                        title: Text(book.title),
                        subtitle: Text(book.author
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
