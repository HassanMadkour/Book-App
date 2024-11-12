import 'package:flutter/material.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/view/widgets/similar_book_u_i_builder.dart';
import 'package:project/core/utils/styles.dart';

class SimilarBooks extends StatelessWidget {
  const SimilarBooks({
    super.key,
    required this.bookEntity,
  });

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "you can also like",
          style: TextStyles.textStyle14.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 20),
        SimilarBookUIBuilder(bookEntity: bookEntity)
      ],
    );
  }
}
