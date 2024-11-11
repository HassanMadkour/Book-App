import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/data/repos/home_repo.dart';
import 'package:project/Features/home/presentation/view_models/fetch_book_cubit/fetch_book_cubit.dart';
import 'package:project/core/utils/locator_service.dart';
import 'widgets/home_view_u_i_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            FetchBookCubit(getIt.get<HomeRepo>())..fetchBooks(),
        child: const HomeViewUIBuilder(),
      ),
    );
  }
}
