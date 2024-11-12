import 'package:bloc/bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/domain/use_cases/fetch_similar_books_use_case_.dart';

part 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit(this.similarBooksUseCase)
      : super(FetchSimilarBooksInitial());
  final FetchSimilarBooksUseCase similarBooksUseCase;
  fetch(int pageNumber) async {
    if (pageNumber == 0) {
      emit(FetchSimilarBooksLoading());
    } else {
      emit(FetchSimilarBooksLoadingPagination());
    }
    await Future.delayed(Duration(seconds: 2));
    var result = await similarBooksUseCase.call(pageNumber);
    result.fold((l) {
      if (pageNumber == 0) {
        emit(FetchSimilarBooksFailure(l.errorMess));
      } else {
        emit(FetchSimilarBooksFailurePagination(l.errorMess));
      }
    }, (r) => emit(FetchSimilarBooksSuccess(r)));
  }
}
