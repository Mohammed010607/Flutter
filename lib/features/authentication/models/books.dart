class Book{
  final String title;
  final String author;
  final String image;
  final bool available;
  final String url;
    final DateTime? borrowdate;
  final DateTime? duedate;
  final int countdown;
  final bool sendreminder; 

  const Book({required this.title
  , required this.author, 
  required this.image, 
  required this.available, 
  required this.url,
  required this.borrowdate,
  required this.duedate,
  required this.countdown,
  required this.sendreminder,
  });
}