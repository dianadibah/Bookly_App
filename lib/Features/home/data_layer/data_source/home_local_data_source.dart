import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';
import '../../domain/entitis/book_entity.dart';

abstract class HomeLocalDataSource {
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0});
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0}) async {
    int startPage = pageNumber * 10;
    int endPage = (pageNumber + 1) * 10;
    var box1 = Hive.box<BookEntity>(featuresBox);
    var length = box1.values.length;
    if (startPage >= length || endPage > length) {
      return [];
    }
    return box1.values.toList();
  }

  @override
  Future<List<BookEntity>> fetchNewestBook({int pageNumber = 0}) async {
    var box1 = Hive.box<BookEntity>(newestBox);
    return box1.values.toList();
  }
}
