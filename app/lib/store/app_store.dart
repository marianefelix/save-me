import 'package:app/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  UserModel user = UserModel();

  @action
  void setUser(UserModel user) {
    this.user = user;
  }
}