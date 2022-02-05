import 'package:app/repositories/category_repository.dart';
import 'package:app/repositories/link_repository.dart';

class ProfileController {
  final CategoryRepository _categoryRepository = CategoryRepository();
  final LinkRepository _linkRepository = LinkRepository();

  Future<int> fetchLinksLength() async {
    final response = await _linkRepository.getLinksLength();

    return response;
  }

  Future<int> fetchCategoriesLength() async {
    final response = await _categoryRepository.getCategoriesLength();

    return response;
  }

  Future<int> fetchFavoriteLinksLength() async {
    final response = await _linkRepository.getFavoriteLinksLength();

    return response;
  }
}