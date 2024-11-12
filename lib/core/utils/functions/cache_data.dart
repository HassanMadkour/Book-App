import 'package:hive/hive.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';

void cacheData(List<BookEntity> books, String booksType) {
  var box = Hive.box<BookEntity>(booksType);
  box.addAll(books);
}
