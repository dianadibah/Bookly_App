 import 'package:hive/hive.dart';

import '../../Features/home/domain/entitis/book_entity.dart';

void addBooksToBox(List<BookEntity> books,String bookName) {
    Box<dynamic> box = Hive.box<BookEntity>(bookName);
    box.addAll(books);
  }