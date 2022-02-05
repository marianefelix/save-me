// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$userAtom = Atom(name: '_AppStore.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void setUser(UserModel user) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<CategoryModel> categories) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.setCategories');
    try {
      return super.setCategories(categories);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLinks(List<LinkModel> links) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setLinks');
    try {
      return super.setLinks(links);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
