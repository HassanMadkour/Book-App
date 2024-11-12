import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:project/Features/home/presentation/view/widgets/best_sailer_widget.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/best_sailer_lait_view_loading.dart';

class NewestBooksUiBuilder extends StatefulWidget {
  const NewestBooksUiBuilder({
    super.key,
  });

  @override
  State<NewestBooksUiBuilder> createState() => _NewestBooksUiBuilderState();
}

class _NewestBooksUiBuilderState extends State<NewestBooksUiBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      listener: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FetchNewestBooksFailurePagination) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMess)));
        }
      },
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess ||
            state is FetchNewestBooksLoadingPagination ||
            state is FetchNewestBooksFailurePagination) {
          return BestSailerSection(
            isPagination: state is FetchNewestBooksLoadingPagination,
            books: books,
          );
        } else if (state is FetchNewestBooksFailure) {
          return Text(state.errMess);
        } else {
          return const BestSailerLastViewLoading();
        }
      },
    );
  }
}
