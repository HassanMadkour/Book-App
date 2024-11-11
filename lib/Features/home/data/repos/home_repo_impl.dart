import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project/Features/home/data/Models/book_model/book_model.dart';
import 'package:project/Features/home/data/repos/home_repo.dart';
import 'package:project/core/errors/failure.dart';
import 'package:project/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, List<BookModel>>> fetchBooks() async {
    List<BookModel> bookModels = [];
    try {
      var jsonData = await apiService
          .get("volumes?Filtering=free-ebooks&q=subject:Programming");
      for (var element in jsonData["items"]) {
        print(element);
        bookModels.add(BookModel.fromJson(element));
      }
      return right(bookModels);
    } on DioException catch (dioException) {
      return left(ServerFailure.fromDioError(dioException));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
