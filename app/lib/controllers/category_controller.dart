import 'package:app/models/link_model.dart';
import 'package:app/repositories/link_repository.dart';

class CategoryController {
  final LinkRepository _linkRepository = LinkRepository();

  Future<List<LinkModel>> fetchLinksByCategory(int categoryId) async {
    final response = await _linkRepository.getLinks();

    final categoryLinks = response.where((linkItem) => 
      linkItem.categoryId == categoryId
    ).toList();

    return categoryLinks;
  }

  Future editLink(Map<String, dynamic> params) async {
    String id = params["id"].toString();
    params.remove("id");
  
    final response = await _linkRepository.updateLink(id, params);

    return response;
  }

  Future deleteLink(int id) async {
    final response = await _linkRepository.deleteLink(id);

    return response;
  }
}