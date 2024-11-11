import 'package:flutter/material.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'widgets/book_details_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBody(
        bookModel: bookModel,
      ),
    );
  }
}
