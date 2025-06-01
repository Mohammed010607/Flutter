import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:library_app/utilities/constants/colors.dart';
import 'package:library_app/features/authentication/models/books.dart';
import 'package:library_app/features/authentication/screens/book_info.dart';
import 'package:library_app/features/authentication/screens/login.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
} 
class _HomeScreenState extends State<HomeScreen> {
    static final List<Book> books = const [
    Book(title: "Linear Algebra Done Right", author: "Sheldon Axler", image: 'assets/images/linear.jpg', available: true, 
    url: "https://firebasestorage.googleapis.com/v0/b/mec-library-database-9f254.firebasestorage.app/o/Books%2FLinear%20Algebra.pdf?alt=media&token=c94f01a9-a2dc-481f-9b37-7cb112ee30a8",
    borrowdate: null,
    duedate: null,
    countdown: 0,
    sendreminder: false),
    Book(title: "Machine Learning Yearning", author: "Andrew NG", image: 'assets/images/machine.jpg', available: true, url: "https://firebasestorage.googleapis.com/v0/b/mec-library-database-9f254.firebasestorage.app/o/Books%2Fmachine%20learning%20yearning.pdf?alt=media&token=0b06c77e-36af-4869-9ebf-a7cd525405fb",
    borrowdate: null,
    duedate: null,
    countdown: 0,
    sendreminder: false
    ),
    Book(title: "Parallel Algorithms", author: "Henri Casanova", image: 'assets/images/algorithms.jpg', available: true, url: "https://firebasestorage.googleapis.com/v0/b/mec-library-database-9f254.firebasestorage.app/o/Books%2FParallel%20algorithms.pdf?alt=media&token=c0759b8e-0780-4ea6-aa75-25e98d3aa997",
    borrowdate: null,
    duedate: null,
    countdown: 0,
    sendreminder: false
    ),
    Book(title: "The R Inferno", author: "Patrick Burns", image: 'assets/images/R.jpg', available: true, url: "https://firebasestorage.googleapis.com/v0/b/mec-library-database-9f254.firebasestorage.app/o/Books%2FR%20inferno.pdf?alt=media&token=b7add8f9-03c1-4ef8-b5e0-eb60be4f20ff",
    borrowdate: null,
    duedate: null,
    countdown: 0,
    sendreminder: false
    ),

];

  List<Book> filterbooks = [];

  @override
  void initState(){
    super.initState();
    filterbooks = books;
  }

  void _filterbooks(String query){
  setState(() {
      filterbooks = books
    .where((book)=> book.title.toLowerCase().contains(query.toLowerCase()))
      .toList();
    });
  }
    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: IconButton(
          icon: const Icon(Iconsax.logout),
          onPressed: (){
            Get.offAll(()=>Loginscreen());
          },
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            const SizedBox(height: 0,),

            //Searchbar:
            Padding(padding:
            const EdgeInsets.all(17),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Books",
                prefixIcon: const Icon(Iconsax.search_favorite),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),                filled: true,
                fillColor: Fcolors.softgrey,
              ),
          onChanged: _filterbooks,
            ), 
            ),


            Padding(
              padding: const EdgeInsets.all(17),
              child: GridView.builder(
                shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  ),


                  itemCount: filterbooks.length,
                  itemBuilder: (context, index){
                    final book = filterbooks[index];
                        return GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bookdetailsscreen(book: book)
                        ,),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Expanded(child: Image.asset(book.image, width: double.infinity, fit: BoxFit.cover,
                            ),
                            ),

                            Padding(padding: const EdgeInsets.all(8),
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                             ),
                            ), 
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}





