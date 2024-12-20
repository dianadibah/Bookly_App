import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featured_book_usecase.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeaturedBookUseCase featuredBookUseCase;
  FeaturedBooksCubit(this.featuredBookUseCase) : super(FeaturedBooksInitial());
  Future<void> getFeaturesBooks({int pageNumber=0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPagenationLoading());
    }
    var books = await featuredBookUseCase.call(pageNumber);
    books.fold((failure) {
      emit(FeaturedBooksFailure(message: failure.message));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
