import 'package:flutter/material.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/core/utils/styles.dart';

import 'best_sailer_item.dart';

class BestSailerSection extends StatelessWidget {
  const BestSailerSection({super.key, required this.books});
  final List<BookModel> books;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Best Sailer", style: TextStyles.textStyle20),
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: books.length,
                  itemBuilder: (context, index) => BestSailerItem(
                        bookModel: books[index],
                      )),
            ),
          ],
        ));
  }
}
