import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/manger/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:project/Features/home/presentation/view/widgets/book_image.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/book_item_loading.dart';
import 'package:project/core/widgets/fading_widget.dart';

class SimilarBookListView extends StatefulWidget {
  const SimilarBookListView({
    super.key,
    required this.books,
    required this.isPagination,
  });

  final List<BookEntity> books;
  final bool isPagination;
  @override
  State<SimilarBookListView> createState() => _SimilarBookListViewState();
}

class _SimilarBookListViewState extends State<SimilarBookListView> {
  late ScrollController _scrollController;
  bool isLoading = false;
  int pageNumber = 1;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(
      pagination,
    );
    super.initState();
  }

  void pagination() async {
    double maxPixel = _scrollController.position.maxScrollExtent;
    double currentPixel = _scrollController.position.pixels;
    if (currentPixel >= maxPixel * .65 && !isLoading) {
      isLoading = true;
      await BlocProvider.of<FetchSimilarBooksCubit>(context)
          .fetch(pageNumber++);
      isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: index >= widget.books.length
            ? const FadingWidget(child: BookItemLoading())
            : BookImage(bookEntity: widget.books[index]),
      ),
      itemCount:
          widget.isPagination ? widget.books.length + 5 : widget.books.length,
    );
  }
}
