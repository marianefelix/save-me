import 'package:app/models/category_model.dart';
import 'package:app/repositories/category_repository.dart';
import 'package:app/repositories/link_repository.dart';

class SaveLinkController {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final LinkRepository _linkRepository = LinkRepository();

  Future<CategoryModel> createCategory(String title) async {
    Map<String, String> category = {
      "title": title
    };
  
    final response = await _categoryRepository.createCategory(category);
    
    return response;
  }

  Future createLink(Map<String, dynamic> params) async {
    final response = await _linkRepository.createLink(params);
    
    return response;
  }

  Future editLink(Map<String, dynamic> params) async {
    String id = params["id"].toString();
    params.remove("id");

    final response = await _linkRepository.updateLink(id, params);
    
    return response;
  }

  Future<List<CategoryModel>> fetchCategoriesByUser() async {
    final response = await _categoryRepository.getCategoriesByUser();

    return response;
  }
}