import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/Featured_books_cubit/featured_books_cubit.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
   FeaturedBooksListViewBlocBuilder({super.key});
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
    }, builder: (context, state) {
      if (state is FeaturedBooksSuccess ||
          state is FeaturedBooksPagenationLoading) {
        return FeaturedBooksListView(
          books: books,
        );
      } else if (state is FeaturedBooksFailure) {
        return Text(state.message);
      } else {
        return const CircularProgressIndicator();
      }
    });
  }
}
