// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:bookly/Features/home/data_layer/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data_layer/data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/Features/home/domain/repository/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImp extends HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;
  HomeRepositoryImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook({int pageNumber=0}) async {
    try {
      List<BookEntity> booksList =
          await homeLocalDataSource.fetchFeaturedBook(pageNumber: pageNumber);
      if (booksList.isNotEmpty) {
      
        return right(booksList);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBook(pageNumber: pageNumber);
      return right(books);
    } on Exception catch(e) {
       if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(message: e.toString()));
      
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook({int pageNumber=0}) async {
    try {
      List<BookEntity> booksList = await homeLocalDataSource.fetchNewestBook();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
      List<BookEntity> books = await homeRemoteDataSource.fetchNewestBook(pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
        return left(ServerFailure(message: e.toString()));
      
    }
  }
}
