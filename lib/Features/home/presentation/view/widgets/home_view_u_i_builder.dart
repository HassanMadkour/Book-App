import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Features/home/presentation/view/widgets/home_view_body.dart';
import 'package:project/Features/home/presentation/view_models/fetch_book_cubit/fetch_book_cubit.dart';

class HomeViewUIBuilder extends StatelessWidget {
  const HomeViewUIBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBookCubit, FetchBookState>(
      builder: (context, state) {
        if (state is FetchBookSuccess) {
          return const HomeViewBody();
        } else if (state is FetchBookFailure) {
          return Center(child: Text(state.errMess));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
