import 'dart:async';
import 'package:logger/logger.dart';
import 'package:mobile/service/storage.dart';
import 'package:mobx/mobx.dart';
import '../model/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  @observable
  User user;

  @action
  void setUser(User user) => this.user = user;
}
