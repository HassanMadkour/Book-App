import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/domain/repos/home_repo.dart';
import 'package:project/Features/home/domain/use_cases/fetch_similar_books_use_case_.dart';
import 'package:project/Features/home/presentation/manger/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:project/core/utils/functions/locator_service.dart';
import 'widgets/book_details_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookEntity});
  final BookEntity bookEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FetchSimilarBooksCubit(
            FetchSimilarBooksUseCase(getIt.get<HomeRepo>()))
          ..fetch(0),
        child: BookDetailsBody(
          bookEntity: bookEntity,
        ),
      ),
    );
  }
}
