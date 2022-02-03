import 'package:app/models/category_model.dart';
import 'package:app/models/link_model.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  List<CategoryModel> categories = ObservableList<CategoryModel>();
  List<LinkModel> links = ObservableList<LinkModel>();

  @action
  void setCategories(List<CategoryModel> categories) {
    this.categories = categories;
  }

  @action
  void setLinks(List<LinkModel> links) {
    this.links = links;
  }
}