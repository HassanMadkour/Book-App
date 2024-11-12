import 'package:hive/hive.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/constants.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks(int pageNumber);
  List<BookEntity> fetchNewestBooks(int pageNumber);
  List<BookEntity> fetchSimilarBooks(int pageNumber);
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks(int pageNumber) {
    List<BookEntity> books = getBooks(featureBookBox, pageNumber);
    return books;
  }

  @override
  List<BookEntity> fetchNewestBooks(int pageNumber) {
    List<BookEntity> books = getBooks(newestBookBox, pageNumber);
    return books;
  }

  @override
  List<BookEntity> fetchSimilarBooks(int pageNumber) {
    List<BookEntity> books = getBooks(similarBookBox, pageNumber);
    return books;
  }

  List<BookEntity> getBooks(String boxType, int pageNumber) {
    var box = Hive.box<BookEntity>(boxType);
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    if (startIndex > box.length || endIndex - 1 > box.length) {
      return [];
    }
    List<BookEntity> books = box.values.toList().sublist(startIndex, endIndex);
    return books;
  }
}
