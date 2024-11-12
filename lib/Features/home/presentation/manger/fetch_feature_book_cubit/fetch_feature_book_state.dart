part of 'fetch_feature_book_cubit.dart';

sealed class FetchFeatureBookState {}

final class FetchFeatureBookInitial extends FetchFeatureBookState {}

final class FetchFeatureBookSuccess extends FetchFeatureBookState {
  final List<BookEntity> books;

  FetchFeatureBookSuccess({required this.books});
}

final class FetchFeatureBookLoading extends FetchFeatureBookState {}

final class FetchFeatureBookLoadingPagination extends FetchFeatureBookState {}

final class FetchFeatureBookFailurePagination extends FetchFeatureBookState {
  final String errMess;

  FetchFeatureBookFailurePagination({required this.errMess});
}

final class FetchFeatureBookFailure extends FetchFeatureBookState {
  final String errMess;

  FetchFeatureBookFailure({required this.errMess});
}
