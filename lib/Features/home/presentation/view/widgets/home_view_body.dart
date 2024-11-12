import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';

import 'package:project/Features/home/presentation/view/widgets/feature_books_ui_builder.dart';
import 'package:project/Features/home/presentation/view/widgets/newest_books_ui_builder.dart';

import 'home_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController _scrollController;
  bool isLoading = false;
  int pageNumber = 1;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(paginationMethod);
    super.initState();
  }

  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void paginationMethod() async {
    double currentPixel = _scrollController.position.pixels;
    double maxPixel = _scrollController.position.minScrollExtent;
    if (currentPixel >= maxPixel * .65 && !isLoading) {
      isLoading = true;
      await BlocProvider.of<FetchNewestBooksCubit>(context).fetch(pageNumber++);
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: const [
        SliverToBoxAdapter(child: CustomAppBar()),
        SliverToBoxAdapter(child: FeatureBooksUiBuilder()),
        SliverToBoxAdapter(child: NewestBooksUiBuilder()),
      ],
    );
  }
}
