import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:logger/logger.dart';
import 'package:mobile/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/model/api/exception/bad-request.dart';
import 'package:mobile/model/api/login-response.dart';
import 'package:mobile/route.dart';
import 'package:mobile/service/api.dart';
import 'package:mobile/service/storage.dart';
import 'package:mobile/store/form/login/login_form_store.dart';
import 'package:mobile/store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import '../../helper/theme.dart';
import '../../widget/customWidgets.dart';
import '../../widget/customLoader.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback loginCallback;

  const LoginScreen({Key key, this.loginCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInState();
}

class _SignInState extends State<LoginScreen> {
  Logger logger = Logger();
  LoginFormStore loginFormStore;

  CustomLoader loader;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Api api = context.read<Api>();
    loginFormStore = LoginFormStore(api: api);
    loginFormStore.setupValidations();
    loginFormStore.addReaction(
        reaction((_) => loginFormStore.loginResponseFuture.error, (val) {
      logger.i('testing exception reaction');
      logger.i(val);
      if (val != null) {
        if (val is BadRequestException) {
          FLToast.showError(
            text: val.errors[0].message,
          );
        }
      }
    }));
    super.initState();
  }

  @override
  void dispose() {
    loginFormStore.dispose();
    super.dispose();
  }

  Widget _body(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          Observer(
              name: 'Username',
              builder: (_) => Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: TextField(
                      onChanged: (value) => loginFormStore.email = value,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Username',
                          errorText: loginFormStore.error.email)))),
          Observer(
              name: 'Password',
              builder: (_) => Container(
                  child: TextField(
                      onChanged: (value) => loginFormStore.password = value,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.screen_login_password.tr(),
                        errorText: loginFormStore.error.password,
                      )))),
          _emailLoginButton(context),
          SizedBox(height: 10),
          _labelButton('Forget password?', onPressed: () {
            Navigator.of(context).pushNamed('/ForgetPasswordPage');
          })
        ],
      ),
    );
  }

  Widget _labelButton(String title, {Function onPressed}) {
    return FlatButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      splashColor: Colors.grey.shade200,
      child: Text(
        title,
        style: TextStyle(
            color: TwitterColor.dodgetBlue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emailLoginButton(BuildContext context) {
    Storage storage = context.watch<Storage>();
    UserStore userStore = context.watch<UserStore>();

    return Observer(
        builder: (_) => Container(
            width: fullWidth(context),
            margin: EdgeInsets.symmetric(vertical: 35),
            child: FLLoadingButton(
              child: Text('Login'),
              color: Color(0xFF0F4C81),
              disabledColor: Color(0xFF0F4C81),
              indicatorColor: Colors.white,
              disabledTextColor: Colors.grey.withAlpha(40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              textColor: Colors.white,
              loading: loginFormStore.isLoading,
              minWidth: 200,
              onPressed: loginFormStore.error.hasErrors ? null : () async {
                LoginResponse loginResponse = await loginFormStore.submit();
                if(loginResponse != null){
                  logger.i('testing loginResponse reaction');
                  logger.i(loginResponse.user.toJson());
                  storage.setToken(loginResponse.token);
                  userStore.setUser(loginResponse.user);
                  Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
                }
              },
            )));
  }

  void _emailLogin() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: customText('Sign in',
            context: context, style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }
}
