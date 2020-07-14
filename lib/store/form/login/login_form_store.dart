import 'package:logger/logger.dart';
import 'package:mobile/model/api/exception/abstract-exception.dart';
import 'package:mobile/model/api/login-response.dart';
import 'package:mobile/service/api.dart';
import 'package:mobile/service/storage.dart';
import 'package:mobile/store/form/login/login_form_error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'login_form_store.g.dart';

class LoginFormStore = _LoginFormStore with _$LoginFormStore;

abstract class _LoginFormStore with Store {
  final LoginFormErrorState error = LoginFormErrorState();
  final Logger logger = Logger();
  Api api;

  _LoginFormStore({this.api});

  @observable
  String email;

  @observable
  String password;

  List<ReactionDisposer> _disposers;

  @observable
  LoginResponse loginResponse;
  @observable
  AbstractException exception;
  @observable
  ObservableFuture<LoginResponse> loginResponseFuture =
      ObservableFuture.value(null);

  @action
  Future<LoginResponse> submit() async {
    exception = null;
    loginResponse = null;
    try {
      Future<LoginResponse> login = this.api.login(email, password);
      loginResponseFuture = ObservableFuture(login);

      return login;
    } catch (e) {
      return Future.value(null);
    }
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  void addReaction(ReactionDisposer a) {
    _disposers.add(a);
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  @computed
  bool get canLogin => !error.hasErrors;

  @computed
  bool get isLoading => loginResponseFuture.status == FutureStatus.pending;

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Cannot be blank' : null;
  }

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Not a valid email';
  }
}
