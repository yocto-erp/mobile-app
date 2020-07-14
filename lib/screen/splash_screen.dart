import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/route.dart';
import 'package:mobile/service/api.dart';
import 'package:mobile/store/user_store.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Api api = Provider.of<Api>(context, listen: false);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Routes.login, (route) => false);
    });
    //startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Text('Loading')),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() async {}
}
