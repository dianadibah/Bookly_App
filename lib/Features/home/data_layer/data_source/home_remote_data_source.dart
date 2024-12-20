import 'package:bookly/Features/home/data_layer/models/book_model/book_model.dart';
import 'package:bookly/core/utils/web_services.dart';

import '../../../../constants.dart';
import '../../../../core/functions/add_data_box.dart';
import '../../domain/entitis/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber=0});
  Future<List<BookEntity>> fetchNewestBook();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final WebServices webServices;

  HomeRemoteDataSourceImp(this.webServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber=0}) async {
    var data = await webServices.get("filter=free-ebooks&q=programming&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooks(data);
    addBooksToBox(books, featuresBox);
    return books;
  }
   
  @override
  Future<List<BookEntity>> fetchNewestBook() async {
    var data = await webServices
        .get("filter=free-ebooks&Sorting=newest&q=programming");
    List<BookEntity> books = getBooks(data);
    addBooksToBox(books, newestBox);
    return books;
  }
  
  List<BookEntity> getBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var data in data["items"]) {
      books.add(BookModel.fromJson(data));
    }
    return books;
  }
}
