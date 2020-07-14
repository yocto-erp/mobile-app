import 'package:fluro/fluro.dart';
import './screen/auth/login_screen.dart';
import './screen/home_screen.dart';
import './screen/splash_screen.dart';

class Routes {
  static Router router = Router();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static void setupRouter() {
    router.define(
      splash,
      handler: Handler(handlerFunc: (context, parameters) => SplashScreen()),
    );
    router.define(
      home,
      handler: Handler(
          handlerFunc: (context, parameters) => HomeScreen(
                title: 'HomeScreen',
              )),
    );
    router.define(
      login,
      handler: Handler(handlerFunc: (context, parameters) => LoginScreen()),
    );
  }
}
