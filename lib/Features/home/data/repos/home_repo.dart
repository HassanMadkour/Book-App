import 'package:dartz/dartz.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBooks();
}
