import 'package:app/services/api.dart';

class UserRepository {
  final api = DioClient.dio;
  final url = '/user';

  Future login(Map<String, String> params) async {
    final loginUrl = url + '/login';
    final response = await api.post(loginUrl, data: params);

    return response;
  }

  Future createUser(Map<String, String> params) async {
    final response = await api.post(url, data: params);

    return response;
  }
}