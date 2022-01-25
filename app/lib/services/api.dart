import 'package:dio/dio.dart';

class DioClient {
  final Dio api = Dio(
    BaseOptions(
      baseUrl: 'https://saveme/api', // TO DO: alterar quando api for hospedada 
      headers: {'Accept': 'application/json'},
    ),
  );
}