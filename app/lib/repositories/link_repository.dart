import 'dart:convert';

import 'package:app/models/link_model.dart';
import 'package:app/services/api.dart';
import 'package:app/storage/user_storage.dart';

class LinkRepository {
  final api = DioClient.dio;
  final url = '/link';

  Future<List<LinkModel>> fetchLinks() async {
    final token = await UserStorage.getToken();
    api.options.headers['Authorization'] = 'Bearer $token)}';

    final response = await api.get(url);
    final data = response.data as List;

    List<LinkModel> links = [];
    
    for (var linkItem in data) {
      links.add(linkItem);
    }

    return links;
  }

  Future createLink(Map params) async {
    final token = await UserStorage.getToken();
    api.options.headers['Authorization'] = 'Bearer $token)}';

    final response = await api.post(url, data: jsonEncode(params));

    return response;
  }

  Future updateLink(LinkModel params) async {
    final token = await UserStorage.getToken();
    final putUrl = url + params.id.toString();
    api.options.headers['Authorization'] = 'Bearer $token)}';

    final response = await api.put(putUrl, data: params.toJson());

    return response;
  }

  Future deleteLink(int id) async {
    final token = await UserStorage.getToken();
    final deleteUrl = url + id.toString();
    api.options.headers['Authorization'] = 'Bearer $token)}';
  
    final response = await api.delete(deleteUrl);

    return response;
  }
}