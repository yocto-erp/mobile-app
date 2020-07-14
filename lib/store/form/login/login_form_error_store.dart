import 'package:mobx/mobx.dart';

part 'login_form_error_store.g.dart';

class LoginFormErrorState = _LoginFormErrorState with _$LoginFormErrorState;

abstract class _LoginFormErrorState with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors =>  email != null || password != null;
}