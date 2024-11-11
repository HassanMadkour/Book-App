import 'package:flutter/material.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/Features/home/presentation/view/widgets/book_details_app_bar.dart';
import 'package:project/Features/home/presentation/view/widgets/book_item.dart';
import 'package:project/Features/home/presentation/view/widgets/rating_row.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/styles.dart';

import 'action_button.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const BookDetailsAppBar(),
              SizedBox(
                  height: kScreenHight * .35,
                  child: BookItem(
                    bookModel: bookModel,
                  )),
              const SizedBox(
                height: 30,
              ),
              Text(
                "The Jungle Book",
                style: TextStyles.textStyle20,
              ),
              Text(
                "Author of book",
                style: TextStyles.textStyle16,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: RatingRow(),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: ActionButton(),
              )
            ],
          )),
    );
  }
}
