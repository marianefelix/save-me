import 'package:app/models/category_model.dart';
import 'package:app/services/api.dart';
import 'package:app/storage/user_storage.dart';

class CategoryRepository {
  final _api = DioClient.dio;
  final _url = '/category';

  Future<List<CategoryModel>> fetchCategories() async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.get(_url);
    final data = response.data as List;

    List<CategoryModel> categories = [];
    
    for (var category in data) {
      categories.add(category);
    }

    return categories;
  }

  Future createCategory(Map<String, String> params) async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.post(_url, data: params);

    return response;
  }
}