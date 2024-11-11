import 'package:flutter/material.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/Features/home/presentation/view/widgets/book_image.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.8 / 4.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookImage(
            bookModel: bookModel,
          ),
        ));
  }
}
