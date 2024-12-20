import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_newest_book_usecase.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBookUseCase fetchNewestBookUseCase;
  NewestBooksCubit(this.fetchNewestBookUseCase) : super(NewestBooksInitial());
  Future<void> getNewestBooks() async {
    emit(NewestBooksLoading());
    var books = await fetchNewestBookUseCase.call();
    books.fold((failure) {
      emit(NewestBooksFailure(message: failure.message));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
