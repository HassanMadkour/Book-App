import 'package:dartz/dartz.dart';
import 'package:project/Features/home/domain/entities/book_entity.dart';
import 'package:project/Features/home/domain/repos/home_repo.dart';
import 'package:project/core/errors/failure.dart';
import 'package:project/core/use_cases/use_case.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BookEntity>>> call(parameter) {
    return homeRepo.fetchNewestBooks(parameter);
  }
}
