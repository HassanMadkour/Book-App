import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/domain/repos/home_repo.dart';
import 'package:project/Features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:project/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:project/Features/home/presentation/manger/fetch_feature_book_cubit/fetch_feature_book_cubit.dart';
import 'package:project/Features/home/presentation/manger/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:project/Features/home/presentation/view/widgets/home_view_body.dart';
import 'package:project/core/utils/functions/locator_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FetchFeatureBookCubit(
                FetchFeatureBooksUseCase(getIt.get<HomeRepo>()))
              ..fetch(0),
          ),
          BlocProvider(
            create: (context) => FetchNewestBooksCubit(
                FetchNewestBooksUseCase(getIt.get<HomeRepo>()))
              ..fetch(0),
          )
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
