import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook({int pageNumber=0});
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook({int pageNumber=0});
}
