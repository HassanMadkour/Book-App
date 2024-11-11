import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/Features/home/presentation/view/widgets/book_item.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/routing.dart';

class BookItemsListView extends StatelessWidget {
  const BookItemsListView({super.key, required this.bookModels});
  final List<BookModel> bookModels;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kScreenHight * .27,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bookModels.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                GoRouter.of(context)
                    .push(AppRouter.kBookDetailsView, extra: bookModels[index]);
              },
              child: BookItem(
                bookModel: bookModels[index],
              ))),
    );
  }
}
