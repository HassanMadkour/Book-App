import 'package:flutter/material.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/view/widgets/book_details_app_bar.dart';
import 'package:project/Features/home/presentation/view/widgets/book_item.dart';
import 'package:project/Features/home/presentation/view/widgets/rating_row.dart';
import 'package:project/Features/home/presentation/view/widgets/similar_books.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/styles.dart';

import 'action_button.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const BookDetailsAppBar(),
              SizedBox(
                  height: kScreenHight * .32,
                  child: BookItem(
                    bookEntity: bookEntity,
                  )),
              const SizedBox(
                height: 25,
              ),
              Text(
                bookEntity.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyle20,
              ),
              Text(
                bookEntity.author ?? "no author",
                style: TextStyles.textStyle16,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: RatingRow(),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0,
                  top: 16.0,
                ),
                child: ActionButton(),
              ),
              SimilarBooks(bookEntity: bookEntity)
            ],
          )),
    );
  }
}
