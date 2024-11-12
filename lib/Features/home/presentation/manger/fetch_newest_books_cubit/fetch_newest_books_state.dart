part of 'fetch_newest_books_cubit.dart';

sealed class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

  FetchNewestBooksSuccess(this.books);
}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksLoadingPagination extends FetchNewestBooksState {}

final class FetchNewestBooksFailurePagination extends FetchNewestBooksState {
  final String errMess;

  FetchNewestBooksFailurePagination(this.errMess);
}

final class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errMess;

  FetchNewestBooksFailure(this.errMess);
}
