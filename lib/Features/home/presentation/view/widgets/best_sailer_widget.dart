import 'package:flutter/material.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/best_sailer_item_loading.dart';
import 'package:project/core/utils/styles.dart';

import 'best_sailer_item.dart';

class BestSailerSection extends StatefulWidget {
  final bool isPagination;
  const BestSailerSection(
      {super.key, required this.books, required this.isPagination});
  final List<BookEntity> books;

  @override
  State<BestSailerSection> createState() => _BestSailerSectionState();
}

class _BestSailerSectionState extends State<BestSailerSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Best Sailer", style: TextStyles.textStyle20),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.isPagination
                    ? widget.books.length + 5
                    : widget.books.length,
                itemBuilder: (context, index) {
                  return index >= widget.books.length
                      ? const BestSailerItemLoading()
                      : BestSailerItem(
                          bookEntity: widget.books[index],
                        );
                }),
          ],
        ));
  }
}
