part of 'fetch_book_cubit.dart';

sealed class FetchBookState {}

final class FetchBookInitial extends FetchBookState {}

final class FetchBookSuccess extends FetchBookState {
  FetchBookSuccess({required this.books});
  final List<BookModel> books;
}

final class FetchBookFailure extends FetchBookState {
  FetchBookFailure({required this.errMess});
  final String errMess;
}

final class FetchBookLoading extends FetchBookState {}
