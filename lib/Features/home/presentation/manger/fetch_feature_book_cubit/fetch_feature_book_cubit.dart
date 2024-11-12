import 'package:bloc/bloc.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/domain/use_cases/fetch_feature_books_use_case.dart';

part 'fetch_feature_book_state.dart';

class FetchFeatureBookCubit extends Cubit<FetchFeatureBookState> {
  FetchFeatureBookCubit(this.featureBooksUseCase)
      : super(FetchFeatureBookInitial());
  final FetchFeatureBooksUseCase featureBooksUseCase;
  fetch(int pageNumber) async {
    if (pageNumber == 0) {
      emit(FetchFeatureBookLoading());
    } else {
      emit(FetchFeatureBookLoadingPagination());
    }
    await Future.delayed(Duration(seconds: 2));
    var result = await featureBooksUseCase.call(pageNumber);
    result.fold((l) {
      if (pageNumber == 0) {
        emit(FetchFeatureBookFailure(errMess: l.errorMess));
      } else {
        emit(FetchFeatureBookFailurePagination(errMess: l.errorMess));
      }
    }, (r) => emit(FetchFeatureBookSuccess(books: r)));
  }
}
