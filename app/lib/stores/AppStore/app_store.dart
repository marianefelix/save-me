import 'package:app/models/category_model.dart';
import 'package:app/models/link_model.dart';
import 'package:app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  UserModel user = UserModel();
  List<CategoryModel> categories = ObservableList<CategoryModel>();
  List<LinkModel> links = ObservableList<LinkModel>();
  List<LinkModel> favoritelinks = ObservableList<LinkModel>();

  @action
  void setUser(UserModel user) {
    this.user = user;
  }

  @action
  void setCategories(List<CategoryModel> categories) {
    this.categories = categories;
  }

  @action
  void setLinks(List<LinkModel> links) {
    this.links = links;
  }

  @action
  void setFavoriteLinks(List<LinkModel> favoritelinks) {
    this.favoritelinks = favoritelinks;
  }
}

AppStore _singletonAppStore = AppStore();
AppStore get appStore => _singletonAppStore;
