import 'package:bookly/Features/home/domain/repository/home_repo.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featured_book_usecase.dart';
import 'package:bookly/core/usecaeses/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entitis/book_entity.dart';

class FetchNewestBookUseCase extends UseCase<List<BookEntity>, Param> {
  final HomeRepository homeRepository;

  FetchNewestBookUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call([Param? params]) async {
    return await homeRepository.fetchNewestBook(pageNumber: params!.pageNumber);
  }
}
