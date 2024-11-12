import 'package:hive/hive.dart';

part 'book_entity.g.dart';

@HiveType(typeId: 1)
class BookEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final num? rating;
  @HiveField(3)
  final num? count;
  @HiveField(4)
  final String bookId;
  @HiveField(5)
  final String image;

  BookEntity(
      {required this.title,
      required this.image,
      required this.author,
      required this.rating,
      required this.count,
      required this.bookId});
}
