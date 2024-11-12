import 'package:project/Features/home/data/models/book_model/book_model.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/constants.dart';
import 'package:project/core/utils/api_service.dart';
import 'package:project/core/utils/functions/cache_data.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks(int pageNumber);
  Future<List<BookEntity>> fetchNewestBooks(int pageNumber);
  Future<List<BookEntity>> fetchSimilarBooks(int pageNumber);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeatureBooks(int pageNumber) async {
    Map<String, dynamic> data = await apiService.get(
        "volumes?Filtering=free-ebooks&q=subject:Programming&startIndex=$pageNumber");
    List<BookEntity> books = getListBook(data);

    cacheData(books, featureBookBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks(int pageNumber) async {
    Map<String, dynamic> data = await apiService.get(
        "volumes?Filtering=free-ebooks&sorting=newest&q=subject:Sport&startIndex=$pageNumber");

    List<BookEntity> books = getListBook(data);

    cacheData(books, newestBookBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks(int pageNumber) async {
    Map<String, dynamic> data = await apiService.get(
        "volumes?Filtering=free-ebooks&sorting=newest&q=subject:Sport&startIndex=$pageNumber");

    List<BookEntity> books = getListBook(data);

    cacheData(books, similarBookBox);

    return books;
  }

  List<BookEntity> getListBook(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var element in data['items']) {
      books.add(BookModel.fromJson(element));
    }

    return books;
  }
}
