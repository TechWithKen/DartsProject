/*This code base mimicks the working principle of libraries and how books 
are borrowed and all using object orieted programming style
*/

//Solution

class Book {
  String? title, author;
  int? publicationYear;

  Book(this.title, this.author, this.publicationYear);

  String? displayInfo() {
    return "Title: $title, Author: $author, Publication Year: $publicationYear";
  }
}

class PhysicalBook extends Book {
  String? shelfLocation;
  bool? isHardCover;

  PhysicalBook(this.shelfLocation, this.isHardCover, super.title, super.author,
      super.publicationYear);
  @override
  String? displayInfo() {
    return "${super.displayInfo()}, Shelf Location: $shelfLocation, Hard Cover?: $isHardCover";
  }
}

class EBook extends Book {
  String? fileSize, format;

  EBook(this.fileSize, this.format, super.title, super.author,
      super.publicationYear);

  @override
  String? displayInfo() {
    return "${super.displayInfo()}, File Size: $fileSize, Format: $format";
  }
}

class Library {
  String? name, address;
  List<String?> books;

  Library(this.name, this.address, this.books);

  void addBook(Book book) {
    books.add(book.title);
  }

  void borrowBook(String title, Library library) {
    library.books.remove(title);
    this.books.add(title);
  }
}

void main() {
  var chemBook = Book("New School", "Ababio", 2012);
  var physicalChemBook =
      PhysicalBook("Left", true, "New Physics", "Ababio", 2012);
  var EChemBook = EBook("70mb", "pdf", "New School", "Ababio", 2012);
  var MainLibrary = Library("Main Library", "7 Kokumo road",
      ["Beauy and The Beast", "Snow White", "Book of Bible stories"]);
  var BranchLibrary = Library("Branch Library", "8 Iyana Iseshi",
      ["Spiderman", "Night Tales Fox", "invincibles"]);

  MainLibrary.addBook(EChemBook);
  BranchLibrary.addBook(chemBook);
  MainLibrary.addBook(physicalChemBook);
  print(MainLibrary.books);
  MainLibrary.borrowBook("Spiderman", BranchLibrary);
  BranchLibrary.borrowBook("Book of Bible stories", MainLibrary);
  print(MainLibrary.books);
  print(BranchLibrary.books);
}
