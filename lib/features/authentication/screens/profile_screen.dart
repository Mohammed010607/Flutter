import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:library_app/features/authentication/models/books.dart';
import 'package:get/get.dart';
import 'package:library_app/features/authentication/controllers/borrowed_books_contoller.dart';
import 'package:library_app/navigation_menu.dart';

class Profile extends StatelessWidget {
  final List<Book> borrowedBooks;

  const Profile({super.key, required this.borrowedBooks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
            icon: const Icon(Iconsax.backward1),
            onPressed: () {
              Get.offAll(() => const Navigation());
            }),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: Text(
              "Borrowed Books",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: borrowedBooks.isEmpty
                ? const Center(
                    child: Text("No Borrowed Books"),
                  )
                : ListView.builder(
                    itemCount: borrowedBooks.length,
                    itemBuilder: (context, index) {
                      final book = borrowedBooks[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 10,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            book.image,
                            height: 50,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                          title: Text(book.title),
                          subtitle: Text(book.author),
                          trailing: ElevatedButton(
                            onPressed: () {
                              final controller =
                                  Get.find<BorrowedBooksContoller>();
                              controller.returnbook(book);
                            },
                            child: const Text("Return"),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
