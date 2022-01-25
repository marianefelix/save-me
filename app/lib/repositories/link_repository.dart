import 'dart:convert';

import 'package:app/models/link_model.dart';
import 'package:app/services/api.dart';

class LinkRepository {
  final api = DioClient.dio;
  final url = '/link';

  Future<List<LinkModel>> fetchLinks() async {
    final response = await api.get(url);
    final data = response.data as List;

    List<LinkModel> links = [];
    
    for (var linkItem in data) {
      links.add(linkItem);
    }

    return links;
  }

  Future<String> addLink(Map params) async {
    final response = await api.post(url, data: jsonEncode(params));

    if (response.statusCode == 200) {
      return "Link salvo com sucesso!";
    }

    return "Erro ao salvar link, tente novamente.";
  }

  Future<String> updateLink(LinkModel params) async {
    final putUrl = url + params.id.toString();
    final response = await api.put(putUrl, data: params.toJson());

    if (response.statusCode == 200) {
      return "Link editado com sucesso!";
    }

    return "Erro ao editar link, tente novamente.";
  }

  Future<String> deleteLink(int id) async {
    final deleteUrl = url + id.toString();
    final response = await api.delete(deleteUrl);

    if (response.statusCode == 200) {
      return "Link removido com sucesso!";
    }

    return "Erro ao remover link, tente novamente.";
  }
}