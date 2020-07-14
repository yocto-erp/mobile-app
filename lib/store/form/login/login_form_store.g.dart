// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginFormStore on _LoginFormStore, Store {
  Computed<bool> _$canLoginComputed;

  @override
  bool get canLogin =>
      (_$canLoginComputed ??= Computed<bool>(() => super.canLogin,
              name: '_LoginFormStore.canLogin'))
          .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_LoginFormStore.isLoading'))
          .value;

  final _$emailAtom = Atom(name: '_LoginFormStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginFormStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$loginResponseAtom = Atom(name: '_LoginFormStore.loginResponse');

  @override
  LoginResponse get loginResponse {
    _$loginResponseAtom.reportRead();
    return super.loginResponse;
  }

  @override
  set loginResponse(LoginResponse value) {
    _$loginResponseAtom.reportWrite(value, super.loginResponse, () {
      super.loginResponse = value;
    });
  }

  final _$exceptionAtom = Atom(name: '_LoginFormStore.exception');

  @override
  AbstractException get exception {
    _$exceptionAtom.reportRead();
    return super.exception;
  }

  @override
  set exception(AbstractException value) {
    _$exceptionAtom.reportWrite(value, super.exception, () {
      super.exception = value;
    });
  }

  final _$loginResponseFutureAtom =
      Atom(name: '_LoginFormStore.loginResponseFuture');

  @override
  ObservableFuture<LoginResponse> get loginResponseFuture {
    _$loginResponseFutureAtom.reportRead();
    return super.loginResponseFuture;
  }

  @override
  set loginResponseFuture(ObservableFuture<LoginResponse> value) {
    _$loginResponseFutureAtom.reportWrite(value, super.loginResponseFuture, () {
      super.loginResponseFuture = value;
    });
  }

  final _$submitAsyncAction = AsyncAction('_LoginFormStore.submit');

  @override
  Future<LoginResponse> submit() {
    return _$submitAsyncAction.run(() => super.submit());
  }

  final _$_LoginFormStoreActionController =
      ActionController(name: '_LoginFormStore');

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_LoginFormStoreActionController.startAction(
        name: '_LoginFormStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_LoginFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_LoginFormStoreActionController.startAction(
        name: '_LoginFormStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_LoginFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
loginResponse: ${loginResponse},
exception: ${exception},
loginResponseFuture: ${loginResponseFuture},
canLogin: ${canLogin},
isLoading: ${isLoading}
    ''';
  }
}
