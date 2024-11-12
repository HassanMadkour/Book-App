import 'package:flutter/material.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/view/widgets/book_image.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.8 / 4.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookImage(
            bookEntity: bookEntity,
          ),
        ));
  }
}
