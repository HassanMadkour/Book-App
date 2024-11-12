import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/manger/fetch_feature_book_cubit/fetch_feature_book_cubit.dart';
import 'package:project/Features/home/presentation/view/widgets/book_item.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/book_item_loading.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/routing.dart';
import 'package:project/core/widgets/fading_widget.dart';

class BookItemsListView extends StatefulWidget {
  const BookItemsListView(
      {super.key, required this.books, required this.isPagination});
  final List<BookEntity> books;
  final bool isPagination;

  @override
  State<BookItemsListView> createState() => _BookItemsListViewState();
}

class _BookItemsListViewState extends State<BookItemsListView> {
  late ScrollController _scrollController;
  bool isLoading = false;
  int pageNumber = 1;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();

    _scrollController.addListener(
      () {
        paginationMethod();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void paginationMethod() async {
    double currentPixel = _scrollController.position.pixels;
    double maxPixel = _scrollController.position.maxScrollExtent;
    if (currentPixel >= .65 * maxPixel && !isLoading) {
      isLoading = true;
      await BlocProvider.of<FetchFeatureBookCubit>(context).fetch(pageNumber++);
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kScreenHight * .27,
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.isPagination
              ? widget.books.length + 5
              : widget.books.length,
          itemBuilder: (context, index) {
            return index >= widget.books.length
                ? const FadingWidget(child: BookItemLoading())
                : GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: widget.books[index]);
                    },
                    child: BookItem(
                      bookEntity: widget.books[index],
                    ));
          }),
    );
  }
}
