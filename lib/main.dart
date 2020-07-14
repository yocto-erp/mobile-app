import 'package:easy_localization/easy_localization.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:mobile/route.dart';
import 'package:mobile/service/api.dart';
import 'package:mobile/service/storage.dart';
import 'package:mobile/store/user_store.dart';
import 'package:provider/provider.dart';

void main() async {
  Routes.setupRouter();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('vi', 'VN')],
        path: 'assets/translations', // <-- change patch to your
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Storage>(create: (_) => Storage()),
          ProxyProvider<Storage, Api>(update: (_, storage, __) => Api(storage)),
          Provider<UserStore>(
            create: (_) => UserStore(),
          )
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            onGenerateRoute: Routes.router.generator,
            initialRoute: Routes.splash,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            builder: (BuildContext context, Widget child) {
              return FLToastProvider(
                  defaults: FLToastDefaults(
                      position: FLToastPosition.top, style: FLToastStyle.light, lightColor: Colors.redAccent,
                  lightBackgroundColor: Colors.black26),
                  child: child);
            }));
  }
}
