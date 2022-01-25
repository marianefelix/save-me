import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://saveme/api', // TO DO: alterar quando api for hospedada 
      headers: {'Accept': 'application/json'},
    ),
  );
}