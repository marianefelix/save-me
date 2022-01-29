import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://saveme-server.herokuapp.com',
      headers: {
        'Accept': 'application/json',
      },
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );
}