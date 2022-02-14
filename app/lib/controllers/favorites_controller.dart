import 'package:app/models/link_model.dart';
import 'package:app/repositories/link_repository.dart';

class FavoritesController {
  final LinkRepository _linkRepository = LinkRepository();

  Future<List<LinkModel>> fetchLinks() async {
    final response = await _linkRepository.getFavoriteLinks();

    return response;
  }
}
