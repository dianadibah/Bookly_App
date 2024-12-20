import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/Features/home/manager/Featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  final List<BookEntity> books;
  const FeaturedBooksListView({Key? key, required this.books})
      : super(key: key);

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late var _scrollcontroller;
  var nextPage = 1;
 late bool isLoading;
  @override
  void initState() {
     isLoading = false;
    _scrollcontroller = ScrollController();
    _scrollcontroller.addListener(pagination);
    super.initState();
  }

  void pagination() async {
    if (_scrollcontroller.position.pixels >=
        0.7 * _scrollcontroller.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .getFeaturesBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: _scrollcontroller,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(imageUrl: widget.books[index].image ?? ""),
            );
          }),
    );
  }
}
