import 'dart:convert';

import 'package:app/models/link_model.dart';
import 'package:app/services/api.dart';
import 'package:app/storage/user_storage.dart';

class LinkRepository {
  final _api = DioClient.dio;
  final _url = '/link';

  Future<List<LinkModel>> getLinks() async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.get(_url);
    final data = response.data as List;

    List<LinkModel> links = [];
    
    for (var linkJson in data) {
      final LinkModel link = LinkModel.fromJson(linkJson);
      links.add(link);
    }

    return links;
  }

  Future createLink(Map<String, dynamic> params) async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.post(_url, data: jsonEncode(params));

    return response;
  }

  Future updateLink(LinkModel params) async {
    final token = await UserStorage.getToken();
    final putUrl = _url + params.id.toString();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.put(putUrl, data: params.toJson());

    return response;
  }

  Future deleteLink(int id) async {
    final token = await UserStorage.getToken();
    final deleteUrl = _url + id.toString();
    _api.options.headers['Authorization'] = 'Bearer $token';
  
    final response = await _api.delete(deleteUrl);

    return response;
  }
}