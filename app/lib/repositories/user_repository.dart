import 'package:app/services/api.dart';

class LinkRepository {
  final api = DioClient.dio;
  final url = '/user';

  Future<String> login(Map<String, String> params) async {
    final loginUrl = url + '/login';
    final response = await api.post(loginUrl, data: params);

    
    if (response.statusCode == 200) {
      return "Sucesso";
    }

    return "Falha na autenticação. Usuário ou senha inválidos!";
  }

  Future<String> createUser(Map<String, String> params) async {
    final response = await api.post(url, data: params);

    if (response.statusCode == 200) {
      return "Sucesso";
    }

    return "Falha ao cadastrar usuário. Tente novamente!";
  }
}