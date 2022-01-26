import 'dart:convert';

import 'package:app/models/category_model.dart';
import 'package:app/services/api.dart';

class CategoryRepository {
  final api = DioClient.dio;
  final url = '/category';

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await api.get(url);
    final data = response.data as List;

    List<CategoryModel> categories = [];
    
    for (var category in data) {
      categories.add(category);
    }

    return categories;
  }

  Future<String> createCategory(Map<String, String> params) async {
    final response = await api.post(url, data: jsonEncode(params));

    if (response.statusCode == 200) {
      return "Categoria salva com sucesso!";
    }

    return "Erro ao salvar categoria, tente novamente.";
  }
}