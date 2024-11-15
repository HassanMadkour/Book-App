import 'package:flutter/material.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/styles.dart';

import 'book_image.dart';
import 'rating_row.dart';

class BestSailerItem extends StatelessWidget {
  const BestSailerItem({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: SizedBox(
        height: kScreenHight * .15,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1.5,
              child: BookImage(
                bookEntity: bookEntity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: SizedBox(
                width: kScreenWidth * .58,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bookEntity.title,
                        style: TextStyles.textStyle18,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                      ),
                      Text(
                        bookEntity.author ?? "no author",
                        style: TextStyles.textStyle14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Free ",
                            style: TextStyles.textStyle16,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const RatingRow()
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
