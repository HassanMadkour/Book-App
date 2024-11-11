import 'package:bloc/bloc.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/Features/home/data/repos/home_repo.dart';

part 'fetch_book_state.dart';

class FetchBookCubit extends Cubit<FetchBookState> {
  FetchBookCubit(this.homeRepo) : super(FetchBookInitial());
  final HomeRepo homeRepo;
  List<BookModel> books = [];
  fetchBooks() async {
    emit(FetchBookLoading());
    var result = await homeRepo.fetchBooks();

    result.fold((failure) {
      emit(FetchBookFailure(errMess: failure.errMessage));
    }, (books) {
      this.books = books;
      emit(FetchBookSuccess(books: books));
    });
  }
}
