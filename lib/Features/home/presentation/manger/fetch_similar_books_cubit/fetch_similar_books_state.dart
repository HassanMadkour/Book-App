part of 'fetch_similar_books_cubit.dart';

sealed class FetchSimilarBooksState {}

final class FetchSimilarBooksInitial extends FetchSimilarBooksState {}

final class FetchSimilarBooksSuccess extends FetchSimilarBooksState {
  final List<BookEntity> books;

  FetchSimilarBooksSuccess(this.books);
}

final class FetchSimilarBooksLoading extends FetchSimilarBooksState {}

final class FetchSimilarBooksLoadingPagination extends FetchSimilarBooksState {}

final class FetchSimilarBooksFailurePagination extends FetchSimilarBooksState {
  final String errMess;

  FetchSimilarBooksFailurePagination(this.errMess);
}

final class FetchSimilarBooksFailure extends FetchSimilarBooksState {
  final String errMess;

  FetchSimilarBooksFailure(this.errMess);
}
