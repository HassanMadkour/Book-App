import 'package:flutter/material.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/book_item_loading.dart';

import 'package:project/constants.dart';
import 'package:project/core/widgets/fading_widget.dart';

class BookItemsListViewLoading extends StatelessWidget {
  const BookItemsListViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kScreenHight * .27,
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) =>
              const FadingWidget(child: BookItemLoading())),
    );
  }
}
