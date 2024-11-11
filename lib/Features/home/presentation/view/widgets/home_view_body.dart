import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/Features/home/presentation/view/widgets/book_items_list_view.dart';
import 'package:project/Features/home/presentation/view_models/fetch_book_cubit/fetch_book_cubit.dart';

import 'best_sailer_widget.dart';
import 'home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<BookModel> books = BlocProvider.of<FetchBookCubit>(context).books;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CustomAppBar()),
        SliverToBoxAdapter(
            child: BookItemsListView(
          bookModels: books,
        )),
        SliverFillRemaining(
            child: BestSailerSection(
          books: books,
        )),
      ],
    );
  }
}
