import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMess;

  Failure({required this.errorMess});
}

class ServerFailure extends Failure {
  ServerFailure(this.errorMessage) : super(errorMess: errorMessage);
  final String errorMessage;
  factory ServerFailure.dioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connection timeout , retry again");
      case DioExceptionType.sendTimeout:
        return ServerFailure("send timeout , retry again");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("receive timeout , retry again");
      case DioExceptionType.badCertificate:
        return ServerFailure("System may be not secure , retry again");
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(e.response!);
      case DioExceptionType.cancel:
        return ServerFailure("the request canceled , retry again");
      case DioExceptionType.connectionError:
        return ServerFailure("no internet , retry again");
      case DioExceptionType.unknown:
        return ServerFailure("Something went wrong  , try later ");
    }
  }

  factory ServerFailure.badResponse(Response response) {
    if (response.statusCode! == 404) {
      return ServerFailure("Service not found , try later");
    } else if (response.statusCode == 500) {
      return ServerFailure("Problem with Server");
    } else if (response.statusCode == 401 ||
        response.statusCode == 400 ||
        response.statusCode == 403) {
      return ServerFailure("Authentication Problem");
    } else {
      return ServerFailure("something went wrong");
    }
  }
}
