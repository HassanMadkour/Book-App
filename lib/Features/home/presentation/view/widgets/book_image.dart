import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    print(bookModel.volumeInfo?.imageLinks?.smallThumbnail ?? '');
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.white,
              ),
          imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? ''),
    );
  }
}
