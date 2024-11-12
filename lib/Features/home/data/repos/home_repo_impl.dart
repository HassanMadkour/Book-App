import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:project/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/domain/repos/home_repo.dart';
import 'package:project/core/errors/failure.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatureBooks(
      int pageNumber) async {
    try {
      List<BookEntity> books =
          homeLocalDataSource.fetchFeatureBooks(pageNumber);
      if (books.isEmpty) {
        books = await homeRemoteDataSource.fetchFeatureBooks(pageNumber);
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.dioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      int pageNumber) async {
    try {
      List<BookEntity> books = homeLocalDataSource.fetchNewestBooks(pageNumber);
      if (books.isEmpty) {
        books = await homeRemoteDataSource.fetchNewestBooks(pageNumber);
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.dioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks(
      int pageNumber) async {
    try {
      List<BookEntity> books =
          homeLocalDataSource.fetchSimilarBooks(pageNumber);
      if (books.isEmpty) {
        books = await homeRemoteDataSource.fetchSimilarBooks(pageNumber);
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.dioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
