import 'package:bookly/Features/home/domain/entitis/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity bookEntity;
  const BookDetailsView({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody( ),
      ),
    );
  }
}
