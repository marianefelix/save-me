import 'package:app/services/api.dart';

class UserRepository {
  final _api = DioClient.dio;
  final _url = '/user';

  Future login(Map<String, String> params) async {
    final loginUrl = _url + '/login';
    final response = await _api.post(loginUrl, data: params);

    return response;
  }

  Future createUser(Map<String, String> params) async {
    final response = await _api.post(_url, data: params);

    return response;
  }
}