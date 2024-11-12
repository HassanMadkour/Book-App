import 'package:dartz/dartz.dart';
import 'package:project/core/errors/failure.dart';

abstract class UseCase<ReturnType> {
  Future<Either<Failure, ReturnType>> call();
}
