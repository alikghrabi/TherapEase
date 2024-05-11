import 'package:dio/dio.dart';

class DioClient {
  Dio getInstance() {
    return Dio(BaseOptions(
      baseUrl: "http://127.0.0.1:8000/api",
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json
    ));
  }
}