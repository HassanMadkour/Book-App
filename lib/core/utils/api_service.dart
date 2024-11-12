import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = "https://www.googleapis.com/books/v1/";

  ApiService(this.dio);

  // get
  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dio.get("$baseUrl$endPoint");

    return response.data;
  }

  //post
}

// import 'package:dio/dio.dart';

// class ApiService {
//   ApiService(this._dio);
//   final Dio _dio;
//   final String _baseUrl = "https://www.googleapis.com/books/v1/";
//   Future<Map<String, dynamic>> get(String endPoint) async {
//     var response = await _dio.get('$_baseUrl$endPoint');
//     return response.data;
//   }
// }
