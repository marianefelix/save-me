import 'dart:convert';

import 'package:app/models/category_model.dart';
import 'package:app/services/api.dart';
import 'package:app/storage/user_storage.dart';

class CategoryRepository {
  final api = DioClient.dio;
  final url = '/category';

  Future<List<CategoryModel>> fetchCategories() async {
    final token = await UserStorage.getToken();
    api.options.headers['Authorization'] = 'Bearer $token)}';

    final response = await api.get(url);
    final data = response.data as List;

    List<CategoryModel> categories = [];
    
    for (var category in data) {
      categories.add(category);
    }

    return categories;
  }

  Future createCategory(Map<String, String> params) async {
    final token = await UserStorage.getToken();
    api.options.headers['Authorization'] = 'Bearer $token)}';

    final response = await api.post(url, data: jsonEncode(params));

    return response;
  }
}