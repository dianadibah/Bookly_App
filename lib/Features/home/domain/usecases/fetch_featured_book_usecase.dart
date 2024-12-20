import 'package:bookly/Features/home/domain/repository/home_repo.dart';
import 'package:bookly/core/usecaeses/usecase.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entitis/book_entity.dart';

class FetchFeaturedBookUseCase extends UseCase<List<BookEntity>, Param> {
  final HomeRepository homeRepository;

  FetchFeaturedBookUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async {
    return await homeRepository.fetchFeaturedBook(pageNumber: param!.pageNumber);
  }
}

class Param {
 final int pageNumber;

  Param(this.pageNumber);
}
