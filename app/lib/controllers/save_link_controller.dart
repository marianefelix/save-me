import 'package:app/repositories/category_repository.dart';
import 'package:app/repositories/link_repository.dart';

class SaveLinkController {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final LinkRepository _linkRepository = LinkRepository();

  Future createCategory(Map<String, String> params) async {
    final response = await _categoryRepository.createCategory(params);
    
    return response;
  }

  Future createLink(Map<String, String> params) async {
    final response = await _linkRepository.createLink(params);
    
    return response;
  }
}