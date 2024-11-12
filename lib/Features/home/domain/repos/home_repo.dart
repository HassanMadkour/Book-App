import 'package:dartz/dartz.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(int pageNumber);
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(int pageNumber);
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(int pageNumber);
}
