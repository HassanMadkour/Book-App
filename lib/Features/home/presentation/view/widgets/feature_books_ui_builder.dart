import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/presentation/manger/fetch_feature_book_cubit/fetch_feature_book_cubit.dart';
import 'package:project/Features/home/presentation/view/widgets/book_items_list_view.dart';
import 'package:project/Features/home/presentation/view/widgets/loading_widgets/book_items_list_view_loading.dart';

class FeatureBooksUiBuilder extends StatefulWidget {
  const FeatureBooksUiBuilder({
    super.key,
  });

  @override
  State<FeatureBooksUiBuilder> createState() => _FeatureBooksUiBuilderState();
}

class _FeatureBooksUiBuilderState extends State<FeatureBooksUiBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeatureBookCubit, FetchFeatureBookState>(
      listener: (context, state) {
        if (state is FetchFeatureBookSuccess) {
          books.addAll(state.books);
        }
        if (state is FetchFeatureBookFailurePagination) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMess)));
        }
      },
      builder: (context, state) {
        if (state is FetchFeatureBookSuccess ||
            state is FetchFeatureBookLoadingPagination ||
            state is FetchFeatureBookFailurePagination) {
          return BookItemsListView(
            isPagination: state is FetchFeatureBookLoadingPagination,
            books: books,
          );
        } else if (state is FetchFeatureBookFailure) {
          return Center(child: Text(state.errMess));
        } else {
          return const BookItemsListViewLoading();
        }
      },
    );
  }
}
