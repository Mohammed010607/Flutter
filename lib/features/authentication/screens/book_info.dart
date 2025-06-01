import 'package:flutter/material.dart';
import 'package:library_app/features/authentication/models/books.dart';
import 'package:get/get.dart';
import 'package:library_app/features/authentication/controllers/borrowed_books_contoller.dart';
class Bookdetailsscreen extends StatelessWidget {
  final Book book;
  const Bookdetailsscreen({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book.image,
              height: 270,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            //-------//
            Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 9),
                  Text(
                    'By ${book.author}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: book.available
                          ? () {
                              final controller =
                                  Get.find<BorrowedBooksContoller>();
                              controller.borrowBook(book);
                            }
                          : null,
                      child: Text(
                        book.available ? "Borrow Book" : "Not Available",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11.5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
