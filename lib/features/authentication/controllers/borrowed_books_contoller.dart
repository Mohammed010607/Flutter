import 'package:get/get.dart';
import 'package:library_app/features/authentication/models/books.dart';

class BorrowedBooksContoller extends GetxController {
  final RxList<Book> borrowedBooks = <Book>[].obs;

  void borrowBook(Book book) {
    final borrowdate = DateTime.now();
    final duedate = borrowdate.add(const Duration(days: 10));
    
    final borrowedbook = Book(
      title: book.title, 
      author: book.author, 
      image: book.image, 
      available: false, 
      url: book.url, 
      borrowdate: borrowdate, 
      duedate: duedate, 
      countdown: 0,
      sendreminder: false
    );

    borrowedBooks.add(borrowedbook);
  }

  void returnbook(Book book) {
    borrowedBooks.remove(book);
  }

  List<Book> getOverduebooks() {
    final now = DateTime.now();
    return borrowedBooks.where((book) => 
      book.duedate != null && book.duedate!.isBefore(now)
    ).toList();
  }

  List<Book> getBooksduesoon() {
    final now = DateTime.now();
    final twoDaysFromNow = now.add(const Duration(days: 2));
    return borrowedBooks.where((book) => 
      book.duedate != null && 
      book.duedate!.isAfter(now) && 
      book.duedate!.isBefore(twoDaysFromNow)
    ).toList();
  }

  void updateReminderstatus(Book book, {bool sent = true}) {
    final index = borrowedBooks.indexWhere((b) => b.title == book.title);
    if (index != -1) {
      final updatedBook = Book(
        title: book.title,
        author: book.author,
        image: book.image,
        available: book.available,
        url: book.url,
        borrowdate: book.borrowdate,
        duedate: book.duedate,
        countdown: book.countdown + 1,
        sendreminder: sent,
      );
      borrowedBooks[index] = updatedBook;
    }
  }

  int getDaysremaining(Book book) {
    if (book.duedate == null) return 0;
    final now = DateTime.now();
    return book.duedate!.difference(now).inDays;
  }

  bool isOverdue(Book book) {
    if (book.duedate == null) return false;
    return book.duedate!.isBefore(DateTime.now());
  }

  void checkduedates() {
    for (var book in borrowedBooks) {
      if (book.duedate != null && 
          book.duedate!.isBefore(DateTime.now()) && 
          !book.sendreminder) {
        Get.snackbar(
          'Return Book',
          '${book.title}"is overdue',
          snackPosition: SnackPosition.TOP,
        );
        updateReminderstatus(book);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkduedates();
  }
}