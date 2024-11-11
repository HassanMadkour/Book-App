import 'package:dio/dio.dart';

class Failure {
  Failure(this.errMessage);
  String errMessage;
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionError:
        return ServerFailure("connectionError");
      case DioExceptionType.sendTimeout:
        return ServerFailure("sendTimeout");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("connectionTimeout");
      case DioExceptionType.cancel:
        return ServerFailure("cancel");
      case DioExceptionType.badResponse:
        return ServerFailure("badResponse");
      default:
        return ServerFailure("Something wrong try again");
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
