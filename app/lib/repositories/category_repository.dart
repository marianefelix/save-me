import 'package:app/models/category_model.dart';
import 'package:app/services/api.dart';
import 'package:app/storage/user_storage.dart';

class CategoryRepository {
  final _api = DioClient.dio;
  final _url = '/category';

  Future<List<CategoryModel>> getCategories() async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.get(_url);
    final data = response.data as List;

    List<CategoryModel> categories = [];
    
    for (var categoryJson in data) {
      final CategoryModel category = CategoryModel.fromJson(categoryJson);

      categories.add(category);
    }
    
    return categories;
  }

  Future<List<CategoryModel>> getCategoriesByUser() async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.get(_url + '/user');
    final data = response.data as List;

    List<CategoryModel> categories = [];

    for (var categoryJson in data) {
      final CategoryModel category = CategoryModel.fromJson(categoryJson);
  
      categories.add(category);
    }
    
    return categories;
  }

  Future<int> getCategoriesLength() async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.get(_url + '/count');
    
    return response.data;
  }

  Future<CategoryModel> createCategory(Map<String, String> params) async {
    final token = await UserStorage.getToken();
    _api.options.headers['Authorization'] = 'Bearer $token';

    final response = await _api.post(_url, data: params);

    CategoryModel category = CategoryModel();
    category.id = response.data['id'];
    category.title = response.data['title'];

    return category;
  }
}