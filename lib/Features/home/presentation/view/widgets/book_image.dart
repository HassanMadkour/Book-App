import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
    required this.bookEntity,
  });
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.white,
              ),
          imageUrl: bookEntity.image),
    );
  }
}
