import 'package:bloc/bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.newestBooksUseCase)
      : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase newestBooksUseCase;
  fetch(int pageNumber) async {
    if (pageNumber == 0) {
      emit(FetchNewestBooksLoading());
    } else {
      emit(FetchNewestBooksLoadingPagination());
    }
    await Future.delayed(const Duration(seconds: 2));
    var result = await newestBooksUseCase.call(pageNumber);
    result.fold((l) {
      if (pageNumber == 0) {
        emit(FetchNewestBooksFailure(l.errorMess));
      } else {
        emit(FetchNewestBooksFailurePagination(l.errorMess));
      }
    }, (r) => emit(FetchNewestBooksSuccess(r)));
  }
}
