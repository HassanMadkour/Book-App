import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/manger/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/book_items_list_view_loading.dart';
import 'package:project/Features/home/presentation/view/widgets/similar_book_list_view.dart';

class SimilarBookUIBuilder extends StatefulWidget {
  const SimilarBookUIBuilder({
    super.key,
    required this.bookEntity,
  });

  final BookEntity bookEntity;

  @override
  State<SimilarBookUIBuilder> createState() => _SimilarBookUIBuilderState();
}

class _SimilarBookUIBuilderState extends State<SimilarBookUIBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * .2,
        child: BlocConsumer<FetchSimilarBooksCubit, FetchSimilarBooksState>(
            listener: (context, state) {
          if (state is FetchSimilarBooksFailurePagination) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMess)));
          }
          if (state is FetchSimilarBooksSuccess) {
            books.addAll(state.books);
          }
        }, builder: (context, state) {
          if (state is FetchSimilarBooksSuccess ||
              state is FetchSimilarBooksFailurePagination ||
              state is FetchSimilarBooksLoadingPagination) {
            return SimilarBookListView(
              books: books,
              isPagination: state is FetchSimilarBooksLoadingPagination,
            );
          } else if (state is FetchSimilarBooksFailure) {
            return Center(child: Text(state.errMess));
          } else {
            return const BookItemsListViewLoading();
          }
        }));
  }
}
