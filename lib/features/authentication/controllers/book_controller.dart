import 'package:get/get.dart';
import 'package:library_app/features/authentication/models/books.dart';

class BookController extends GetxController{
  final RxList<Book> books = <Book>[].obs;

  void borrowBook(Book book){
    
  }
}