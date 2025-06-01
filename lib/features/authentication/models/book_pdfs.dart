class BookPdfs {
  final String id;
  final String title;
  final String author;
  final String image;
  final String pdf;
  final bool available;


BookPdfs({
  required this.id,
  required this.title,
  required this.author,
  required this.image,
  required this.pdf,
  required this.available,
});

factory BookPdfs.fromJson(Map<String, dynamic>json){
  return BookPdfs(
    id: json['id'], title: json["title"], author: json["author"], image: json["image"], pdf:json["pdf"],available:json["available"],
  );
}
Map < String, dynamic > toJson() {
  return{
    "id": id,
    "title" : title,
    "author":author,
    "image" : image, 
    "pdf":pdf,
    "available": available
  };
}


}