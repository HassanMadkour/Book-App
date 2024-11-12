import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/constants.dart';

Future<void> hiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(featureBookBox);
  await Hive.openBox<BookEntity>(similarBookBox);
  await Hive.openBox<BookEntity>(newestBookBox);
}
