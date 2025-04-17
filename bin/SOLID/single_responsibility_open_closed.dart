void main (){
  // Create a book
  Book myBook = Book(
    'The Flutter Journey',
    'Science',
    'Flutter is Google’s UI toolkit for building beautiful apps...',
  );

  // Print the book using ConsolePrinter
  BookPrinter printer = ConsolePrinter();
  printer.printBook(myBook);

  // Save the book using FileBookSaver
  SaverBook saver = FileBookSaver();
  saver.save(myBook, '/books/flutter_journey.txt');
}
class Book {
  final String title;
  final String category;
  final String content;

  Book( this.title, this.category, this.content);


}
abstract class BookPrinter{
  void printBook(Book book);
}

class ConsolePrinter implements BookPrinter{
  @override
  void printBook(Book book) {
    print('Title: ${book.title}\n Category: ${book.category}\n Content: ${book.content}');
  }
}

abstract class SaverBook{
  void save(Book book, String path);
}
class FileBookSaver implements SaverBook {
  @override
  void save(Book book, String path) {
    // Imagine logic to save book content to a file
    print('Saving book "${book.title}" to $path');
  }
}