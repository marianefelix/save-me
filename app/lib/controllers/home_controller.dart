import 'package:app/models/category_model.dart';
import 'package:app/models/link_model.dart';
import 'package:app/repositories/category_repository.dart';
import 'package:app/repositories/link_repository.dart';

class SaveLinkController {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final LinkRepository _linkRepository = LinkRepository();

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await _categoryRepository.fetchCategories();

    return response;
  }

  Future<List<LinkModel>> fetchLinks() async {
    final response = await _linkRepository.fetchLinks();

    return response;
  }
}