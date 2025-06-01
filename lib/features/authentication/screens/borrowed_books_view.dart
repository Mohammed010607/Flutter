import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:library_app/features/authentication/controllers/borrowed_books_contoller.dart';
import 'package:library_app/features/authentication/models/books.dart';
import 'package:library_app/features/authentication/screens/view_pdf.dart';

class Borrowedbooksview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BorrowedBooksContoller>();
    final borrowedbooks = controller.borrowedBooks;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Books"),
      ),
      body: Obx(() => ListView.builder(
        itemCount: borrowedbooks.length,
        itemBuilder: (context, index) {
          final Book book = borrowedbooks[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
            child: ListTile(
              leading: Image.asset(
                book.image,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
              title: Text(book.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.author),
                  if (book.duedate != null)
                    Text(
                      'Due: ${book.duedate!.toString().split(' ')[0]}',
                      style: TextStyle(
                        color: book.duedate!.isBefore(DateTime.now()) 
                          ? Colors.red 
                          : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
              trailing: book.duedate != null && book.duedate!.isBefore(DateTime.now())
                ? const Icon(Iconsax.warning_2)
                : null,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Viewpdf(
                      url: book.url, 
                      title: book.title
                    )
                  )
                );
              },
            ),
          );
        },
      )),
    );
  }
}
